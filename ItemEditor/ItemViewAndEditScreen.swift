//
//  ItemViewAndEditScreen.swift
//  ItemEditor
//
//  Created by Steven Fisher on 2024-03-28.
//

import SwiftUI

/// ItemViewAndEditScreen wraps an ItemDetailsView and provides Edit/Done (and Cancel).
struct ItemViewAndEditScreen: View {
    @Environment(\.editMode) private var editMode
    @State var item: Item

    func edit() {
        print("edit")
        editMode?.wrappedValue = .active
    }

    func cancel() {
        print("cancel")
        editMode?.wrappedValue = .inactive
    }

    func done() {
        print("done")
        editMode?.wrappedValue = .inactive
    }

    var body: some View {
        let isEditing = editMode?.wrappedValue.isEditing == true

        ItemDetailsView(item: item)
            .navigationBarBackButtonHidden(isEditing)

            .toolbar {
                if isEditing {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel", role: .cancel, action: cancel)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(isEditing ? "Done" : "Edit", action: isEditing ? done : edit)
                }
            }

    }
}

#Preview {
    ItemViewAndEditScreen(item: Item())
}
