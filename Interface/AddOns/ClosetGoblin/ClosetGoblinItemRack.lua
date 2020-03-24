-- Credits to Realwild (ItemRack Addon) http://war.curseforge.com/addons/itemrack/

CG_ItemRack = {}
CG_ItemRack.equipmentData = {}
CG_ItemRack.Window="CG_ItemRackEQShow1"

local isOnUpdateActive = false
local WindowGetParent = WindowGetParent
local WindowGetAnchor = WindowGetAnchor

function CG_ItemRack.Initialize()
	RegisterEventHandler(SystemData.Events.PLAYER_INVENTORY_SLOT_UPDATED, "CG_ItemRack.Equipped");

    CG_ItemRack.oldMouseOverSlot=CharacterWindow.MouseOverSlot
    CharacterWindow.MouseOverSlot=CG_ItemRack.MouseOverSlot

   	CreateWindow(CG_ItemRack.Window, false)

	--CG_ItemRack.Backpack.Init();
end

function CG_ItemRack.OnUpdate()	-- redesigned and only active when needed
	local mouseOverWin = SystemData.MouseOverWindow.name
	local _,_,relwin,_,_ = WindowGetAnchor(CG_ItemRack.Window, 1)
	local parentWindow = WindowGetParent(mouseOverWin)
	if mouseOverWin ~= relwin
	and parentWindow ~= "CG_ItemRackEQShow1Equipment"
	and parentWindow ~= "ClosetGoblinCharacterWindowContentsEquipment" then
		CG_ItemRack.CloseAll()
	end
end

function CG_ItemRack.ShowItemRackWindowAt(slotString, slot)
	CG_ItemRack.UpdateSlotIcons()
	WindowClearAnchors (CG_ItemRack.Window)
	if(slot<=5 or slot==11 or slot==12) then
        WindowAddAnchor (CG_ItemRack.Window, "bottomleft", slotString..slot , "topleft", 0, 0)
    else
        WindowAddAnchor (CG_ItemRack.Window, "topright", slotString..slot , "topleft", -2, 0)
    end
	WindowSetShowing(CG_ItemRack.Window, true )
	if not isOnUpdateActive then
		WindowRegisterCoreEventHandler(CG_ItemRack.Window, "OnUpdate", "CG_ItemRack.OnUpdate")
		isOnUpdateActive = true
	end
end

function CG_ItemRack.DoPreHookMouseOverSlot(slot, itemData)		-- this is the pre-hook to the charwindow slot

    if itemData == nil or itemData.equipSlot==nil or itemData.equipSlot==0 then
        CG_ItemRack.equipSlot=slot
    else
        CG_ItemRack.equipSlot=itemData.equipSlot
    end
	
	CG_ItemRack.Slot_Dest=slot
	CG_ItemRack.UpdateEquipmentData(CG_ItemRack.equipSlot)
	
end

function CG_ItemRack.MouseOverSlot(slot,...)		-- this is the hook to the charwindow slot
	if ClosetGoblin.settings.useItemRackOnCharacterWindow then
		if CharacterWindow.mode ~= CharacterWindow.MODE_ITEM_APPEARANCE then
			local itemData = CharacterWindow.equipmentData[slot]
			
			CG_ItemRack.DoPreHookMouseOverSlot(slot, itemData)
			CG_ItemRack.ShowItemRackWindowAt("CharacterWindowContentsEquipmentSlot",slot)
		end
	end
    return CG_ItemRack.oldMouseOverSlot(slot,...)
end

function CG_ItemRack.CloseAll()
    WindowSetShowing(CG_ItemRack.Window, false )
	WindowUnregisterCoreEventHandler(CG_ItemRack.Window, "OnUpdate")
	isOnUpdateActive = false
end


function CG_ItemRack.UpdateEquipmentData(equipSlot)
    local inv=GetInventoryItemData ()
    
    CG_ItemRack.equipmentData={}
    for i,item in ipairs(inv) do
--    	d(item.equipSlot)
        if(CG_ItemRack.CheckSlot(equipSlot,item) and DataUtils.SlotIsAllowedForItem(equipSlot,item) and DataUtils.PlayerCanUseItem(item)) then
            item.CG_ItemRackSlot=i
            table.insert(CG_ItemRack.equipmentData,item)
        end
    end
end

-- see CharacterWindow.UpdateSlotIcons()
function CG_ItemRack.UpdateSlotIcons()
    local texture, x, y  = 0, 0, 0
    local tint = CharacterWindow.NORMAL_TINT 
    local count=0
    
    for slot=1,10 do
        local e=CG_ItemRack.equipmentData[slot]
        if(e) then
            texture, x, y = GetIconData( e.iconNum ) 
            tint = CharacterWindow.NORMAL_TINT
    
            DynamicImageSetTexture(CG_ItemRack.Window.."EquipmentSlot"..slot.."IconBase", texture, x, y )
            WindowSetShowing(CG_ItemRack.Window.."EquipmentSlot"..slot, true )
            count=slot
        else
            WindowSetShowing(CG_ItemRack.Window.."EquipmentSlot"..slot, false )
        end
    end
	WindowSetDimensions(CG_ItemRack.Window, 75*count, 75)
end

-- Creates a confirm dialog for BoE items,
-- which will then call the RequestMoveItem() if the player presses OK
function CG_ItemRack.IsConfirmationNeededToMoveItem( Source, SourceSlot, DestSlot )

    if( Source == Cursor.SOURCE_INVENTORY )
    then
        
        local playerItems   = DataUtils.GetItems()
        local itemData      = playerItems[SourceSlot]
        if( itemData.uniqueID ~= 0 and itemData.flags[GameData.Item.EITEMFLAG_BIND_ON_EQUIP] and not itemData.boundToPlayer )
        then
            DialogManager.MakeTwoButtonDialog( GetString(StringTables.Default.TEXT_BIND_ON_EQUIP_CONFIRMATION), 
                                               GetString(StringTables.Default.LABEL_YES), CG_ItemRack.RequestMoveItem, 
                                               GetString(StringTables.Default.LABEL_NO) )
            return true
        end
    end
    
    return false
end

function CG_ItemRack.RequestMoveItem()
    RequestMoveItem( Cursor.SOURCE_INVENTORY, CG_ItemRack.equipmentData[CG_ItemRack.Slot_Source].CG_ItemRackSlot, Cursor.SOURCE_EQUIPMENT, CG_ItemRack.Slot_Dest, 1 )
end

function CG_ItemRack.EquipmentMouseOver()
    CG_ItemRack.Slot_Source=WindowGetId(SystemData.ActiveWindow.name);
    CG_ItemRack.ItemTooltip(CG_ItemRack.Slot_Source)
end

function CG_ItemRack.EquipmentRButtonDown()
    CG_ItemRack.Slot_Source=WindowGetId(SystemData.ActiveWindow.name)
    local itemData=CG_ItemRack.equipmentData[CG_ItemRack.Slot_Source]
	
	if CG_ItemRack.IsConfirmationNeededToMoveItem( Cursor.SOURCE_INVENTORY, itemData.CG_ItemRackSlot, CG_ItemRack.Slot_Dest ) then
		return
	end
    -- Attempt to drop the object
    RequestMoveItem( Cursor.SOURCE_INVENTORY, itemData.CG_ItemRackSlot, Cursor.SOURCE_EQUIPMENT, CG_ItemRack.Slot_Dest, 1 )
end

function CG_ItemRack.Equipped()
    CG_ItemRack.UpdateEquipmentData(CG_ItemRack.equipSlot)
    CG_ItemRack.UpdateSlotIcons()
    CG_ItemRack.ItemTooltip(CG_ItemRack.Slot_Source)
end

function CG_ItemRack.ItemTooltip(slot)
    local itemData=CG_ItemRack.equipmentData[slot]
    if(not itemData) then return end
    Tooltips.CreateItemTooltip( itemData, CG_ItemRack.Window.."EquipmentSlot"..slot, Tooltips.ANCHOR_WINDOW_RIGHT, false )   
end

function CG_ItemRack.CheckSlot(slot,itemData)
	if(not slot) then
		return(false);
	end
	if(not itemData.equipSlot) then
		return(false);
	end
	if(slot==itemData.equipSlot) then
		return(true);
	end
	if(slot==1 and itemData.equipSlot==4) then
		return(true);
	end	
	if(slot==2 and itemData.equipSlot==4) then
		return(true);
	end	
	if(slot>=17 and slot<=20 and itemData.equipSlot==17) then
		return(true);
	end	
end