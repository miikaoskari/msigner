//
//  Item.swift
//  msigner
//
//  Created by Miika Karjalainen on 18.2.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
