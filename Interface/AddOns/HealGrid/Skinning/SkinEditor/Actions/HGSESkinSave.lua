HGSESkinSave = {};

function HGSESkinSave.Initialize()

	CreateWindowFromTemplate( 'HGSE_SkinSave', 'HGSE_SkinSaveTemplate', 'HGSE_SkinAttributePanel' );

	ButtonSetText( "HGSE_SkinSaveSave", L"Save" );

	WindowSetShowing( 'HGSE_SkinSave', false );

end

function HGSESkinSave.Shutdown()

end

function HGSESkinSave.Activate()

	LabelSetText( "HGSE_SkinSaveName", L"Save skin" );
	LabelSetText( "HGSE_SkinSaveWipeLabel", L"Clean up modification" );
	LabelSetText( "HGSE_SkinSaveModsLabel", L"Apply modifications" );
	LabelSetText( "HGSE_SkinSaveApplyLabel", L"Apply skin to grids" );
	LabelSetText( "HGSE_SkinSaveStatus", L"" );

	ButtonSetPressedFlag( "HGSE_SkinSaveWipeButton", false );
	ButtonSetPressedFlag( "HGSE_SkinSaveModsButton", false );
	ButtonSetPressedFlag( "HGSE_SkinSaveApplyButton", false );

	HealGridUtility.LabelSetTextColor( "HGSE_SkinSaveWipeLabel", 'WHITE' );
	HealGridUtility.LabelSetTextColor( "HGSE_SkinSaveModsLabel", 'WHITE' );
	HealGridUtility.LabelSetTextColor( "HGSE_SkinSaveApplyLabel", 'WHITE' );

	LabelSetText( "HGSE_SkinSaveModsEntryText", L"(total)" );
	LabelSetText( "HGSE_SkinSaveApplyEntryText", L"(total)" );

	WindowSetShowing( 'HGSE_SkinSave', true );

end

function HGSESkinSave.DeActivate()

	WindowSetShowing( 'HGSE_SkinSave', false );

end

function HGSESkinSave.SaveSkin()

	HealGridSkinEditor.SaveSkin();

end

function HGSESkinSave.Start()

	LabelSetText( "HGSE_SkinSaveStatus", L"Status: Working" );

end

function HGSESkinSave.End()

	LabelSetText( "HGSE_SkinSaveStatus", L"Status: Success" );

end

function HGSESkinSave.SectionStart( section )

	HealGridUtility.LabelSetTextColor( "HGSE_SkinSave"..section.."Label", 'YELLOW' );

end

function HGSESkinSave.SectionEnd( section )

	HealGridUtility.LabelSetTextColor( "HGSE_SkinSave"..section.."Label", 'GREEN' );
	ButtonSetPressedFlag( "HGSE_SkinSave"..section.."Button", true );

end

function HGSESkinSave.SectionUpdate( section, total )

	LabelSetText( "HGSE_SkinSave"..section.."Entry", wstring.format(L"%d",total) );

end
