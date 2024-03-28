//
//  ItemDetailsView.swift
//  ItemEditor
//
//  Created by Steven Fisher on 2024-03-28.
//

import SwiftUI

/// ItemDetailsView handles displaying or editing an Item based on editMode.
struct ItemDetailsView: View {
    @Environment(\.editMode) private var editMode
    @State var item: Item

    var body: some View {
        let isEditing = editMode?.wrappedValue.isEditing == true

        Form {
            VStack(alignment: .leading) {
                Text("Name".uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)

                if isEditing {
                    TextField("Name", text: $item.name)
                        .padding(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.secondary)
                        )
                } else {
                    Text(item.name)
                        .lineLimit(1)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ItemDetailsView(item: Item())
    }
}
