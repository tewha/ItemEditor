//
//  ContentView.swift
//  ItemEditor
//
//  Created by Steven Fisher on 2024-03-28.
//

import SwiftData
import SwiftUI

/// ContentView is the main app view.
/// Usually I'd split this more, but Apple's new project puts it in one view.
/// This sets up the navigation split view and shows the list of items, plus offers Add, Edit and Delete.
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var showingNew = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        ItemViewAndEditScreen(item: item)
                    } label: {
                        Text(item.name)
                            .lineLimit(1)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }

            .sheet(isPresented: $showingNew) {
                NavigationStack {
                    ItemAddScreen(item: Item())
                }
            }

        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            showingNew = true
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
