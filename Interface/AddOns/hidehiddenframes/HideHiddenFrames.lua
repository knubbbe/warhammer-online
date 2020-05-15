HideHiddenFrames = {}
local LayoutEditor_Begin_ORIG
local LayoutEditor_OnToggleHidden_ORIG

function HideHiddenFrames.Initialize()
    LayoutEditor_Begin_ORIG = LayoutEditor.Begin
    LayoutEditor.Begin = HideHiddenFrames.Begin
    LayoutEditor_OnToggleHidden_ORIG = LayoutEditor.OnToggleHidden
    LayoutEditor.OnToggleHidden = HideHiddenFrames.OnToggleHidden
end

function HideHiddenFrames.Begin()
    LayoutEditor_Begin_ORIG()
    for _, frame in pairs(LayoutEditor.framesList) do
        if (frame.m_windowData.isUserHidden) then frame:Show(false) end
    end
end

function HideHiddenFrames.OnToggleHidden()
    local rowIndex = WindowGetId(WindowGetParent(SystemData.ActiveWindow.name))
    local dataIndex = ListBoxGetDataIndex(
                          "LayoutEditorWindowControlScreenBrowserWindowsList",
                          rowIndex)
    local frame = LayoutEditor.windowBrowserDataList[dataIndex]
    LayoutEditor_OnToggleHidden_ORIG()
    frame:Show(not frame:IsHidden())
end
