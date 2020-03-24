--[[
Copyright (c) 2008, Naeru@Ulthuan
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation  
and/or other materials provided with the distribution.
Neither the name of the Candymancer Coding Company nor the names of its contributors may be used to endorse or promote products derived from 
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

ClosetGoblinZoneWindow = {};
ClosetGoblinZoneWindow.selectedSetDataIndex = nil;
ClosetGoblinZoneWindow.activeMenuRow = nil;
ClosetGoblinZoneWindow.associationTable = {};

--[[
   Character Window Event Handlers
 ]]

function ClosetGoblinZoneWindow.OnInitialize()
	WindowSetShowing("ClosetGoblinZoneWindow", false)
	ClosetGoblinZoneWindow.show = false;
	
	LabelSetText("ClosetGoblinZoneWindowTitleBarText", cgL["ClosetGoblin_Zone_Configuration"]);

	ButtonSetText("ClosetGoblinZoneWindowContentsChangeZoneButton", cgL["Change"]);
	ButtonSetText("ClosetGoblinZoneWindowContentsSortZoneButton", cgL["Zone"]);
	ButtonSetText("ClosetGoblinZoneWindowContentsSortSetButton", cgL["Set_Name"]);
	
	WindowSetShowing("ClosetGoblinZoneWindowContentsSortUpArrow", false);
	WindowSetShowing("ClosetGoblinZoneWindowContentsSortDownArrow", false);
	WindowSetShowing("ClosetGoblinZoneWindowContentsSortSetUpArrow", false);
	WindowSetShowing("ClosetGoblinZoneWindowContentsSortSetDownArrow", false);
	
	ClosetGoblinZoneWindow.RefreshOption();
	ClosetGoblinZoneWindow.UpdateAssociationTable();
end;

function ClosetGoblinZoneWindow.OnShow()
	ClosetGoblinZoneWindow.UpdateAssociationTable();
	WindowUtils.OnShown();
		
	ClosetGoblinZoneWindow.selectedSetDataIndex = 1;
	
	-- If language data are loaded. We need to do this test for the case of a reloadui and the zone config windows is stay open
	if cgL then
		ClosetGoblinZoneWindow.RefreshOption();
	end;
	ClosetGoblinZoneWindow.RefreshList();
end;

function ClosetGoblinZoneWindow.OnHide()
	WindowUtils.OnHidden();
end

function ClosetGoblinZoneWindow.OnShutdown()
end;

function ClosetGoblinZoneWindow.Show()
	WindowSetShowing("ClosetGoblinZoneWindow", true)
end

function ClosetGoblinZoneWindow.Hide()
	WindowSetShowing("ClosetGoblinZoneWindow", false)
end

function ClosetGoblinZoneWindow.RefreshOption()
	LabelSetText("ClosetGoblinZoneWindowContentsZoneOption", cgL["Setting_zones_to_sets"].. ClosetGoblin.ToEnabled(ClosetGoblin.settings.zoneChange));
end;

function ClosetGoblinZoneWindow.OnClickChangeZoneOptionButton()
	ClosetGoblin.ZoneChangeChange();
	ClosetGoblinZoneWindow.RefreshOption();
end;

function ClosetGoblinZoneWindow.UpdateSetRow()
	if ClosetGoblinZoneWindowContentsSetList.PopulatorIndices ~= nil then
		for rowIndex, dataIndex in ipairs(ClosetGoblinZoneWindowContentsSetList.PopulatorIndices) do
			local set = ClosetGoblin.GetSet(dataIndex)
			local rowMod = math.mod(rowIndex, 2)
			local rowColor = DataUtils.GetAlternatingRowColor(rowMod)
			
			WindowSetTintColor("ClosetGoblinZoneWindowContentsSetListRow" .. rowIndex .. "BackgroundZone", rowColor.r, rowColor.g, rowColor.b)
			WindowSetAlpha("ClosetGoblinZoneWindowContentsSetListRow" .. rowIndex .. "BackgroundZone", rowColor.a)
			
			ClosetGoblinZoneWindow.UpdateHighlightOnRow(rowIndex, dataIndex == ClosetGoblinZoneWindow.selectedSetDataIndex)
		end
	end
end

function ClosetGoblinZoneWindow.UpdateHighlightOnRow(rowIndex, highlight)
	local color = DefaultColor.WHITE
	if highlight then
		color = DefaultColor.GOLD
	end
	
	LabelSetTextColor("ClosetGoblinZoneWindowContentsSetListRow" .. rowIndex .. "Zone", color.r, color.g, color.b)
	WindowSetShowing("ClosetGoblinZoneWindowContentsSetListRow" .. rowIndex .. "SelectionBorder", highlight)
end

function ClosetGoblinZoneWindow.RefreshList()
	ClosetGoblinZoneWindow.UpdateAssociationTable();
	ClosetGoblinZoneWindow.BuildDisplayOrder();
	ClosetGoblinZoneWindow.SortSetList();
	ClosetGoblinZoneWindow.UpdateSetList();
--	ClosetGoblinZoneWindow.UpdateSlotIcons()
end;

function ClosetGoblinZoneWindow.BuildDisplayOrder()
	ClosetGoblin.setDisplayZoneOrder = {};
	local dispIndex = 1;
	for index, setData in ipairs(ClosetGoblinZoneWindow.associationTable) do
		ClosetGoblin.setDisplayZoneOrder[dispIndex] = index;
		dispIndex = dispIndex + 1;
	end;
end;

function ClosetGoblinZoneWindow.SortSetList()
    table.sort(ClosetGoblin.setDisplayZoneOrder, ClosetGoblin.CompareZones);
end;

function ClosetGoblinZoneWindow.UpdateSetList()
	ListBoxSetDisplayOrder("ClosetGoblinZoneWindowContentsSetList", ClosetGoblin.setDisplayZoneOrder);
end;

function ClosetGoblinZoneWindow.OnClickZoneRow()
	local rowIndex = WindowGetId(SystemData.ActiveWindow.name);
	local dataIndex = ClosetGoblinZoneWindowContentsSetList.PopulatorIndices[rowIndex];
	ClosetGoblinZoneWindow.selectedSetDataIndex = dataIndex;
	
	ClosetGoblinZoneWindow.UpdateSetList();
--	ClosetGoblinZoneWindow.UpdateSlotIcons()
end;

function ClosetGoblinZoneWindow.UpdateAssociationTable()
	ClosetGoblinZoneWindow.associationTable = {};
	for z, s in pairs( ClosetGoblin.currentProfile.zoneToSet) do
		table.insert(ClosetGoblinZoneWindow.associationTable, {
			zone = towstring(z),
			set = towstring(s)
		})
	end;
end;

function ClosetGoblinZoneWindow.OnSetZoneRowContextMenu()
	ClosetGoblinZoneWindow.activeMenuRow = WindowGetId(SystemData.ActiveWindow.name)
	local dataIndex = ClosetGoblinZoneWindowContentsSetList.PopulatorIndices[ClosetGoblinZoneWindow.activeMenuRow]
	ClosetGoblinZoneWindow.selectedSetDataIndex = dataIndex
	
	ClosetGoblinZoneWindow.UpdateSetList()
--	ClosetGoblinZoneWindow.UpdateSlotIcons()
	
	EA_Window_ContextMenu.CreateContextMenu(SystemData.ActiveWindow.name);
	for index, setName in ipairs(ClosetGoblin.sortedSetsList) do
		EA_Window_ContextMenu.AddMenuItem(cgL["Associate_with_set"]:gsub(L"#1#", setName), ClosetGoblinZoneWindow.OnRowMenuAssoiacteClick, false, true);
	end;
	EA_Window_ContextMenu.AddMenuItem(cgL["Unassociate_with_set"], ClosetGoblinZoneWindow.OnRowMenuUnassoiacteClick, false, true);
	EA_Window_ContextMenu.Finalize();
end;

function ClosetGoblinZoneWindow.OnRowMenuAssoiacteClick()
	local zone = tostring(ClosetGoblinZoneWindow.associationTable[ClosetGoblinZoneWindow.selectedSetDataIndex].zone);
	local idContextMenu = WindowGetId(SystemData.MouseOverWindow.name);
	ClosetGoblin.AssociateZoneToSet(zone, ClosetGoblin.sortedSetsList[idContextMenu]);
end;

function ClosetGoblinZoneWindow.OnRowMenuUnassoiacteClick()
	local zone = tostring(ClosetGoblinZoneWindow.associationTable[ClosetGoblinZoneWindow.selectedSetDataIndex].zone);
	ClosetGoblin.AssociateZoneToSet(zone, L"");
end;