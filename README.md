# ItemEditor
I want to create an app that behaves like most of Apple's simple list apps, supporting add, edit and delete.

## How To Use It
The project has no dependancies. Open the project, build & run. If you want to test on real hardware, you may need to change the developmeant team and bundle identifier.

The code is organized all into one folder. The most relevant bits:

* Item is the SwiftData model.
* ItemDetailsView contains the viewer/editor for an Item.
* ItemAddScreen is the wrapper around ItemViewAndEditScreen that provides the Add frame (with working Add/Cancel).
   * This works as is, but may need changes depending on changes to ItemDetailsView and ItemViewAndEditScreen.
* ItemViewAndEditScreen is the wrapper around ItemViewAndEditScreen that provides the View frame with Edit/Done/Cancel.
   * Neither button works as expected; see Shortcomings.
* ContentView is the main app view.
   * This is responsible for opening ItemAddScreen and ItemViewAndEditScreen, so it may need changes.

## Goals
1. A list of items, backed by SwiftData.
2. An Edit button that shows delete buttons.
3. Swipe to delete also works.
4. There's an Add button that shows a single screen that lets you create the item.
   1. It can't be created until the item validates.
5. When you tap an item later, you can tap an Edit button.
   1. There's a Cancel button that reverts the item.
   2. There's a Done button that saves the item, assuming it validates.
      Just disabling Done also seems to be an option, but I'd rather know how to do it both ways. I'm willing to add more fields to make that a useful thing.

All implemented in SwiftUI and SwiftData!

Note that I don't currently implement ordering. I know how to do it and will probably add it later.

## Shortcomings
Here's where this currently falls short:

1. Changes made to on the edit screen are currently applied immediately, without validation.
2. Cancel doesn't work.

## Feedback & Future
Any ideas, folks? Pull requests, maybe?

The plan is to keep this project up forever, updating it as necessary, to serve as something future users can pull from.

If there's a good, small example of this elsewhere I'll happily replace the repo with a link to that.
