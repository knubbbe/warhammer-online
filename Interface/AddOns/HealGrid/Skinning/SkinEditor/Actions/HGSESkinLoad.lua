HGSESkinLoad = {};

function HGSESkinLoad.Initialize()

	CreateWindowFromTemplate( 'HGSE_SkinLoad', 'HGSE_SkinLoadTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinLoad', false );

	LabelSetText( "HGSE_SkinLoadModsLabel", L"Load skin" );
	LabelSetText( "HGSE_SkinLoadModsEntryText", L"(mods/total)" );
	ButtonSetText( "HGSE_SkinLoadLoad", L"Load" );

end

function HGSESkinLoad.Shutdown()

end

function HGSESkinLoad.Activate()

	LabelSetText( "HGSE_SkinLoadName", L"Load Skin" );
	LabelSetText( "HGSE_SkinLoadStatus", L"" );
	HealGridSkin.ComboBoxSetChoices( "HGSE_SkinLoadSkin", HealGridSkinEditor.skinID );
	ButtonSetPressedFlag( "HGSE_SkinLoadModsButton", false );
	WindowSetShowing( "HGSE_SkinLoadMods", false );
	WindowSetShowing( "HGSE_SkinLoadModsEntry", false );
	WindowSetShowing( "HGSE_SkinLoadModsEntryText", false );

	WindowSetShowing( 'HGSE_SkinLoad', true );

end

function HGSESkinLoad.DeActivate()

	WindowSetShowing( 'HGSE_SkinLoad', false );

end

function HGSESkinLoad.LoadSkin()

	local skinID = HealGridSkin.ComboBoxGetSelected( "HGSE_SkinLoadSkin" );

	HealGridSkinEditor.LoadSkin( skinID, false );

end

function HGSESkinLoad.Start( silent )

	if ( not silent ) then
		LabelSetText( "HGSE_SkinLoadStatus", L"Status: Working" );
		WindowSetShowing( "HGSE_SkinLoadMods", true );
		WindowSetShowing( "HGSE_SkinLoadModsEntry", true );
		WindowSetShowing( "HGSE_SkinLoadModsEntryText", true );
	end

end

function HGSESkinLoad.End( silent )

	if ( not silent ) then
		LabelSetText( "HGSE_SkinLoadStatus", L"Status: Success" );
	end

end

function HGSESkinLoad.SectionStart( section, silent )

	if ( not silent ) then
		HealGridUtility.LabelSetTextColor( "HGSE_SkinLoad"..section.."Label", 'YELLOW' );
	end

end

function HGSESkinLoad.SectionEnd( section, silent )

	if ( not silent ) then
		HealGridUtility.LabelSetTextColor( "HGSE_SkinLoad"..section.."Label", 'GREEN' );
		ButtonSetPressedFlag( "HGSE_SkinLoad"..section.."Button", true );
	end

end

function HGSESkinLoad.SectionUpdate( section, count, total, silent )

	if ( not silent ) then
		LabelSetText( "HGSE_SkinLoad"..section.."Entry", wstring.format(L"%d/%d",count,total) );
	end

end
