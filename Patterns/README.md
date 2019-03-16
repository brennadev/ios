#  Patterns

#### Geometric Abstract Art iOS App I'm Currently Working On

I'm currently working on this app, and these screenshots show the current progress of it.

See my [iOS README](../README.md) for more details on the app. These screenshots are meant to show the types of art the user can create with the app along with showing the main UI on both iPhones and iPads. The UI is still a work-in-progress in some places.

The final version of the app will only have the Metal implementation; this app started out with the UIBezierPath implementation, and I realized later on that Metal would be a better option for what I'm wanting to do with the app. I'm currently working on getting all the pattern styles to work in the Metal implementation.

#### UIBezierPath Implementation
- [PatternsiPad1](PatternsiPad1.png): Pattern style grid random (grid of squares/rectangles with them filled randomly with user's selected colors)
- [PatternsiPad2](PatternsiPad2.png): Pattern style random triangles (triangles placed at random locations on the screen)

- [PatternsiPhone1](PatternsiPhone1.png): Pattern style random circles (circles placed at random locations on the screen)
- [PatternsiPhone2](PatternsiPhone2.png): Pattern style grid zig zag (grid of squares/rectangles in a zig zag design)
- [PatternsiPhone3](PatternsiPhone3.png): Pattern style grid zig zag (grid of squares/rectangles in a zig zag design); has the pattern's spacing increased, showing the effect of adjusting that control
- [PatternsiPhone4](PatternsiPhone4.png): Shows where the user selects a pattern type, organized by category

#### Metal Implementation
- [PatternsiPadMetal1](PatternsiPadMetal1.PNG): Pattern style grid "V" showing start of Metal implementation
