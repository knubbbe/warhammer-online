RMetGuiBroker = {};

RMetGuiBroker.objList = {};
RMetGuiBroker.paneList = {};

-- =========================================================================================
-- Add an object to the broker
-- =========================================================================================

function RMetGuiBroker.Add( obj )

	local paneID = obj:GetPaneID();
	local frameName = obj:GetFrameName();

	if ( RMetGuiBroker.paneList[paneID] == nil ) then
		RMetGuiBroker.paneList[paneID] = {};
	end

	RMetGuiBroker.objList[frameName] = obj;
	RMetGuiBroker.paneList[paneID][frameName] = obj;

end

-- =========================================================================================
-- Initialize the pane
-- =========================================================================================

function RMetGuiBroker.InitializePane( paneID, totalWidth )

	if ( RMetGuiBroker.paneList[paneID] ~= nil ) then
		for frameName,_ in pairs(RMetGuiBroker.paneList[paneID]) do
			if ( totalWidth ) then
				RMetGuiBroker.paneList[paneID][frameName]:SetTotalWidth( totalWidth );
			end

			RMetGuiBroker.paneList[paneID][frameName]:Initialize( nil, 300 );
		end
	end

end

-- =========================================================================================
-- Activate the pane
-- =========================================================================================

function RMetGuiBroker.ActivatePane( paneID )

	if ( RMetGuiBroker.paneList[paneID] ~= nil ) then
		for frameName,_ in pairs(RMetGuiBroker.paneList[paneID]) do
			RMetGuiBroker.paneList[paneID][frameName]:Activate();
		end
	end

end

-- =========================================================================================
-- Shutdown the pane
-- =========================================================================================

function RMetGuiBroker.ShutdownPane( paneID )

	if ( RMetGuiBroker.paneList[paneID] ~= nil ) then
		for frameName,_ in pairs(RMetGuiBroker.paneList[paneID]) do
			RMetGuiBroker.paneList[paneID][frameName]:Shutdown();
		end
	end

end

-- =========================================================================================
-- Synchronize a radio group
-- =========================================================================================

function RMetGuiBroker.SyncRadioGroup( radioButton )

	local paneID = radioButton:GetPaneID();
	local groupID = radioButton:GetGroupID();

	if ( groupID ~= nil ) then
		for frameName,_ in pairs(RMetGuiBroker.paneList[paneID]) do
			if ( RMetGuiBroker.paneList[paneID][frameName]:GetGroupID() == groupID ) then
				RMetGuiBroker.paneList[paneID][frameName]:Activate();
			end
		end
	end

end

-- =========================================================================================
-- ComboBox callback
-- =========================================================================================

function RMetGuiBroker.ComboBoxOnSelChanged( selected )

	local frameName = string.sub(SystemData.ActiveWindow.name,1,-9);

	RMetGuiBroker.objList[frameName]:ChangeValue( selected );

end

-- =========================================================================================
-- CheckButton callback
-- =========================================================================================

function RMetGuiBroker.CheckButtonOnLButtonUp()

	local frameName = SystemData.ActiveWindow.name;

	RMetGuiBroker.objList[frameName]:ChangeValue();

end

-- =========================================================================================
-- Slider callback
-- =========================================================================================

function RMetGuiBroker.SliderOnSlide( sliderPos )

	local frameName = string.sub(SystemData.ActiveWindow.name,1,-7);

	RMetGuiBroker.objList[frameName]:ChangeValue( sliderPos );

end

-- =========================================================================================
-- ColorPicker callback
-- =========================================================================================

function RMetGuiBroker.ColorPickerEditForegroundColor()

	local frameName = string.sub(SystemData.ActiveWindow.name,1,-7);

	RMetGuiBroker.objList[frameName]:EditForegroundColor();

end

function RMetGuiBroker.ColorPickerEditBackgroundColor()

	local frameName = string.sub(SystemData.ActiveWindow.name,1,-7);

	RMetGuiBroker.objList[frameName]:EditBackgroundColor();

end
