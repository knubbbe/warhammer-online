HGSESkinReset = {};

function HGSESkinReset.Initialize()

	CreateWindowFromTemplate( 'HGSE_SkinReset', 'HGSE_SkinResetTemplate', 'HGSE_SkinAttributePanel' )

	ButtonSetText( "HGSE_SkinResetReset", L"Reset" );

	WindowSetShowing( 'HGSE_SkinReset', false );

end

function HGSESkinReset.Shutdown()

end

function HGSESkinReset.Activate()

	LabelSetText( "HGSE_SkinResetName", L"Restore skin to defaults" );
	LabelSetText( "HGSE_SkinResetClearLabel", L"Clear modifications" );
	LabelSetText( "HGSE_SkinResetWipeLabel", L"Restore default attributes" );
	LabelSetText( "HGSE_SkinResetApplyLabel", L"Apply skin to grids" );
	LabelSetText( "HGSE_SkinResetStatus", L"" );

	LabelSetText( "HGSE_SkinResetApplyEntryText", L"(total)" );

	HealGridUtility.LabelSetTextColor( "HGSE_SkinResetClearLabel", 'WHITE' );
	HealGridUtility.LabelSetTextColor( "HGSE_SkinResetWipeLabel", 'WHITE' );

	ButtonSetPressedFlag( "HGSE_SkinResetClearButton", false );
	ButtonSetPressedFlag( "HGSE_SkinResetWipeButton", false );

	WindowSetShowing( 'HGSE_SkinReset', true );

end

function HGSESkinReset.DeActivate()

	WindowSetShowing( 'HGSE_SkinReset', false );

end

function HGSESkinReset.ResetSkin()

	HealGridSkinEditor.ResetSkin();

end

function HGSESkinReset.Start()

	LabelSetText( "HGSE_SkinResetStatus", L"Status: Working" );

end

function HGSESkinReset.End()

	LabelSetText( "HGSE_SkinResetStatus", L"Status: Success" );

end

function HGSESkinReset.SectionStart( section )

	HealGridUtility.LabelSetTextColor( "HGSE_SkinReset"..section.."Label", 'YELLOW' );

end

function HGSESkinReset.SectionEnd( section )

	HealGridUtility.LabelSetTextColor( "HGSE_SkinReset"..section.."Label", 'GREEN' );
	ButtonSetPressedFlag( "HGSE_SkinReset"..section.."Button", true );

end

function HGSESkinReset.SectionUpdate( section, total )

	LabelSetText( "HGSE_SkinReset"..section.."Entry", wstring.format(L"%d",total) );

end
