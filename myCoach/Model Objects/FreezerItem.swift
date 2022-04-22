//
//  FreezerItem.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/21/22.
//

import Foundation

// FreezerItem Object Itself
struct FreezerItem: Identifiable{
    let id = UUID();
    var title: String;
    var expirationDate: String;
    //TODO: Figure out a way to use date instead of a string here
    //TODO: Research how barcodes work and how to add an item based on barcode
    
    init(title: String, expirationDate: String){
        self.title = title;
        self.expirationDate = expirationDate;
    }
}


//TODO: Add an ability to add freezer items



// Use == to check whether the item is the same item
extension FreezerItem: Hashable {
    static func == (lhs: FreezerItem, rhs: FreezerItem) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

