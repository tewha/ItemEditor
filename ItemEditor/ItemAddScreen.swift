//
//  ItemAddScreen.swift
//  ItemEditor
//
//  Created by Steven Fisher on 2024-03-28.
//

import SwiftUI

/// ItemAddScreen wraps an ItemDetailsView and provides Cancel/Add.
struct ItemAddScreen: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext

    @State var item: Item

    var body: some View {
        let isCreateDisabled = item.name.isEmpty

        ItemDetailsView(item: item)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", role: .cancel) {
                        modelContext.insert(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(isCreateDisabled)
                }
            }
            .environment(\.editMode, Binding(get: { .active }, set: { _ in }))
    }
}

#Preview {
    ItemAddScreen(item: Item())
}
