# CombatTextNames

Large bold font and ability names (and/or icons) for default EA combat text.

Configuration is in the `.lua` (at least for now). You can configure:

- text scale (normal/crit/point gain)
- text colors
- display ability names
- hide ability icons
- and everything else, you have full control over the code :)

In `.xml` you can configure:

- text font
- icon size
- icon anchor

## Interaction

To toggle text for all/some events (for performance reasons or whatever), you can use the macros listed below.
LibSlash short commands aren't working from inside macros so I see no reason to include them.

```
/script CombatTextNames.Toggle(); CombatTextNames.PrintState()

/script CombatTextNames.ToggleIncomingDamage(); CombatTextNames.PrintState()

/script CombatTextNames.ToggleIncomingHeals(); CombatTextNames.PrintState()

/script CombatTextNames.ToggleIncomingMisses(); CombatTextNames.PrintState()
```

## Screenshots

![Screenshot](https://i.imgur.com/a76gmad.png)

Other addons in the screenshot: TargetInfoRing, Byakugan (disclaimer: both unfinished).

## Credits

Icon support is based on implementation by Fox.
