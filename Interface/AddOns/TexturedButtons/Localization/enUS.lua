TexturedButtons = TexturedButtons or {};
if (not TexturedButtons.Localization) then
	TexturedButtons.Localization = {};
	TexturedButtons.Localization.Language = {};
end

TexturedButtons.Localization.Language[SystemData.Settings.Language.ENGLISH] = 
{
	["Setup.Menu.Title"] = L"TexturedButtons",
	["Setup.Menu.Advanced"] = L"Advanced",
	["Setup.Menu.Display"] = L"Display",
	["Setup.Menu.Textures"] = L"Textures",
	["Setup.Menu.Cooldown"] = L"Cooldown",
	["Setup.Menu.Fonts"] = L"Fonts",
	["Setup.Menu.Tint"] = L"Tints",
	["Setup.Menu.Misc"] = L"Misc",
	["Setup.Menu.Actionbar"] = L"Actionbars",
	
	["Setup.AdvancedTextures.Title"] = L"Advanced Textures",
	["Setup.AdvancedTextures.SelectBar"] = L"Select the bar you want to modify",
	["Setup.AdvancedTextures.Bars.Actionbar"] = L"Actionbar %d",
	["Setup.AdvancedTextures.Bars.Stance"] = L"Stance",
	["Setup.AdvancedTextures.Bars.Pet"] = L"Pet Abilities",
	["Setup.AdvancedTextures.Bars.Granted"] = L"Granted Abilities",
	
	["Setup.Textures.Title"] = L"Textures",
	["Setup.Textures.UseCustom"] = L"Custom",
	["Setup.Textures.UsePreset"] = L"Preset",
	["Setup.Textures.Disabled"] = L"Disable",
	
	["Setup.Textures.Preset.Name"] = L"Preset",
	["Setup.Textures.Preset.Author"] = L"Author",
	["Setup.Textures.Preset.Description"] = L"Description",
	
	["Setup.Textures.Custom.Button"] = L"Button State",
	["Setup.Textures.Custom.Texture"] = L"Texture",
	["Setup.Textures.Custom.Name"] = L"Name",
	["Setup.Textures.Custom.Example"] = L"Example",
	
	["Setup.Textures.ButtonState.Normal"] = L"Normal",
	["Setup.Textures.ButtonState.Highlighted"] = L"Highlighted",
	["Setup.Textures.ButtonState.Pressed"] = L"Pressed",
	["Setup.Textures.ButtonState.PressedHighlighted"] = L"PressedHighlighted",
	
	["Setup.Cooldown.Title"] = L"Cooldown",
	["Setup.Cooldown.Enable"] = L"Enable cooldown modification",
	["Setup.Cooldown.HideFlash"] = L"Hide cooldown flash",
	["Setup.Cooldown.CooldownAnimation"] = L"Cooldown animation",
	["Setup.Cooldown.RemoveCooldownS"] = L"Remove the \"s\" at the end of the cooldown text",
	["Setup.Cooldown.ShowGlobalCooldownText"] = L"Show global cooldown text",
	["Setup.Cooldown.EnableButtonTinting"] = L"Tint buttons on cooldown",
	
	["Setup.Fonts.Title"] = L"Fonts",
	["Setup.Fonts.Enable"] = L"Enable font modification",
	["Setup.Fonts.Example"] = L"Example",
	["Setup.Fonts.Keybind"] = L"Keybind",
	["Setup.Fonts.Cooldown"] = L"Cooldown",
	["Setup.Fonts.HideKeybind"] = L"Hide keybind",
	["Setup.Fonts.HideCooldown"] = L"Hide cooldown",
	
	["Strings.Alpha"] = L"Alpha",
	["Strings.Font"] = L"Font",
	["Strings.Color"] = L"Color",
	["Strings.Color.Red"] = L"Red",
	["Strings.Color.Green"] = L"Green",
	["Strings.Color.Blue"] = L"Blue",
	
	["Setup.Tint.Title"] = L"Tints",
	["Setup.Tint.Enable"] = L"Enable tinting modification",
	["Setup.Tint.Type"] = L"The tint for when a button is:",
	["Setup.Tint.Type.EnabledValid"] = L"Enabled, valid target",
	["Setup.Tint.Type.EnabledValid.Info"] = L"(Default, ability is useable)",
	["Setup.Tint.Type.EnabledInvalid"] = L"Enabled, invalid target",
	["Setup.Tint.Type.EnabledInvalid.Info"] = L"(Target is out of range)",
	["Setup.Tint.Type.DisabledInvalid"] = L"Disabled, invalid target",
	["Setup.Tint.Type.DisabledInvalid.Info"] = L"(Ability cannot be used on that target)",
	["Setup.Tint.Type.Disabled"] = L"Disabled",
	["Setup.Tint.Type.Disabled.Info"] = L"(Ability is not useable)",
	["Setup.Tint.Type.OnCooldown"] = L"On cooldown",
	["Setup.Tint.Type.OnCooldown.Info"] = L"(Ability is on cooldown)",
	
	["Setup.Misc.Title"] = L"Miscellaneous",
	["Setup.Misc.HideGlow"] = L"Hide the glow effect (Archmage/Shaman mechanic)",
	["Setup.Misc.SaveQuicklock"] = L"Save the settings of the quick lock",
	["Setup.Misc.MovableQuicklock"] = L"Make the quick lock movable",
	["Setup.Misc.CooldownPulse"] = L"Enable Cooldown Pulse (pulses action buttons)",
	["Setup.Misc.CustomGlow"] = L"Glow effect modification",
	["Setup.Misc.CustomGlow.None"] = L"None",
	["Setup.Misc.CustomGlow.CustomSize"] = L"On resized buttons",
	["Setup.Misc.CustomGlow.All"] = L"On all buttons",
	["Setup.Misc.HideActive"] = L"Hide the active ability animation",
	["Setup.Misc.HideQuicklock"] = L"Hide the quick lock",
	["Setup.Misc.ActionButtonPickUpModifier"] = L"Modifier to pick up locked buttons",
	["Setup.Misc.ActionButtonPickUpModifier.None"] = L"Disabled",
	["Setup.Misc.ActionButtonPickUpModifier.Alt"] = L"Alt",
	["Setup.Misc.ActionButtonPickUpModifier.Ctrl"] = L"Ctrl",
	["Setup.Misc.ActionButtonPickUpModifier.Shift"] = L"Shift",
	
	["Setup.Actionbar.Title"] = L"Actionbars",
	["Setup.Actionbar.Enable"] = L"Enable actionbar modification",
	["Setup.Actionbar.Bar"] = L"Bar %d",
	["Setup.Actionbar.Actionbar"] = L"Actionbar",
	["Setup.Actionbar.Selector"] = L"Page selector",
	["Setup.Actionbar.Selector.Right"] = L"Right",
	["Setup.Actionbar.Selector.Left"] = L"Left",
	["Setup.Actionbar.Selector.Hide"] = L"Hide",
	["Setup.Actionbar.HideBackground"] = L"Hide background",
	["Setup.Actionbar.HideEmpty"] = L"Hide empty slots",
	["Setup.Actionbar.Padding"] = L"Padding",
	["Setup.Actionbar.Padding.X"] = L"X",
	["Setup.Actionbar.Padding.Y"] = L"Y",
	["Setup.Actionbar.Spacing"] = L"Spacing",
	["Setup.Actionbar.Spacing.X"] = L"X",
	["Setup.Actionbar.Spacing.Y"] = L"Y",
};

