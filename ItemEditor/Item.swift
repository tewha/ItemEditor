//
//  Item.swift
//  ItemEditor
//
//  Created by Steven Fisher on 2024-03-28.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var name: String

    init() {
        self.timestamp = Date()
        self.name = ""
    }
}
