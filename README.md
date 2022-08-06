# GlyphList
A WoW addon that displays a list of available glyphs for your class.

The addon shows a list of glyphs for your class, and highlights the ones that are known for the active spec.

Highlight colours are as follows:
- Green: Learned for the active spec
- Red: Exclusive with a learned glyph

A check/cross icon is shown instead of the glyph icon to improve accessibility for colourblind users.

Glyphs are initially displayed depending on whether the associated spells or abilities have been learned or talented; click the "View all" checkbox to show any hidden glyphs.

Please bear in mind that the list highlights glyphs for the active spec *only*. If you have glyphed a certain spell in one spec and then switch to another spec where that spell (if available) is not glyphed, the highlighting is removed.

Shift + left click can be used to link any listed glyph in chat.
Use /gl or /glyphlist to toggle list visibility.
Commands: /gl (show|hide|config)

The config screen lets you show/hide the Druid "Marks" that unlock shapeshift forms in the barber shop when learned.

Note: It is currently not possible to see in the addon which of these forms have been unlocked. The only way to do this is to visit the barber shop in-game and look for the available customisations for each form.
