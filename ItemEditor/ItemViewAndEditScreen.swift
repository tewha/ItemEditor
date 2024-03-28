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

    var body: some View {
        let isEditing = editMode?.wrappedValue.isEditing == true

        ItemDetailsView(item: item)
            .navigationBarBackButtonHidden(isEditing)

            .toolbar {
                if isEditing {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel", role: .cancel) {
                            // Rollback or abandon changes here.
                        }
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                    // On Edit, disable autosave?
                    // On Done, validate and save.
                }
            }

    }
}

#Preview {
    ItemViewAndEditScreen(item: Item())
}
