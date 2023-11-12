# GlyphList
A WoW addon that displays a list of available glyphs and appearance unlocks for your class.

The addon shows a list of glyphs for your class, and highlights the ones that are known for the active spec.

Druids will be able to see a second tab that displays Marks which, when learned, unlock shapeshift appearances in the barbershop. Warlocks will see a tab for Grimoires which unlock appearances for their demons in the barbershop. All of these are account-wide and also highlighted if known.

The Refresh button can be used to update the active tab as sometimes not all information is available instantly.

Highlight colours are as follows:
- Green: Learned for the active spec
- Red: Exclusive with a learned glyph

A check/cross icon is shown instead of the glyph icon to improve accessibility for colourblind users.

Glyphs are initially displayed depending on whether the associated spells or abilities have been learned or talented; click the "View all" checkbox to show any hidden glyphs.

Please bear in mind that the list highlights glyphs for the active spec *only*. If you have glyphed a certain spell in one spec and then switch to another spec where that spell (if available) is not glyphed, the highlighting is removed.

Shift + left click can be used to link any listed glyph/mark in chat.

Use /gl or /glyphlist to toggle list visibility.
Commands: /gl (show|hide|forceupdate)
