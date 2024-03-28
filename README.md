# ItemEditor
I want to create an app that behaves like most of Apple's simple apps.

1. A list of items, backed by SwiftData.
2. An Edit button that shows delete buttons.
3. Swipe to delete also works.
4. There's an Add button that shows a single screen that lets you create the item.
   1. It can't be created until the item validates.
5. When you tap an item later, you can tap an Edit button.
   1. There's a Cancel button that reverts the item.
   2. There's a Done button that saves the item, assuming it validates.

All implemented in SwiftUI and SwiftData!

Here's where this currently falls short:

1. Changes made to on the edit screen are currently applied immediately, without validation.
2. Cancel doesn't work.

Any ideas, folks?

The plan is to keep this project up forever, updating it as necessary, to serve as something future users can pull from.
