//
//  FreezerItem.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/21/22.
//

import Foundation

// FreezerItem Object Itself
struct FreezerItem: Identifiable, Codable{
    var id: Int;
    var title: String;
    var expirationDate: String;
    //TODO: Figure out a way to use date instead of a string here
}

//extension FreezerItem {
//    init?(for id: FreezerItem.ID) {
//        guard let freezeritem = FreezerItem.all().first(where: { $0.id == id }) else {return nil};
//        self.freezeritem;
//    }
//}


extension FreezerItem: Hashable {
    static func == (lhs: FreezerItem, rhs: FreezerItem) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// FreezerItem List
extension FreezerItem {
    @FreezerItemArrayBuilder
    static func all() -> [FreezerItem] {
        FreezerItem(id: 1, title:"test", expirationDate: "test");
    }
}

//extension FreezerItem {
//    init?(id: FreezerItem.ID, title: String, expirationDate: String) {
//        self.init(id: id, title: title, expirationDate: expirationDate)
//    }
//}

//TODO: Figure out a way to initialize a FreezerItem
//TODO: Create an array of freezer items
//TODO: Display the array of freezer items to the FreezerView
//TODO: Add an ability to add freezer items
//TODO: Research how barcodes work and how to add an item based on barcode


//FIXME: I have no fucking clue what this code does
@resultBuilder
enum FreezerItemArrayBuilder {
    static func buildEither(first component: [FreezerItem]) -> [FreezerItem] {
        return component
    }

    static func buildEither(second component: [FreezerItem]) -> [FreezerItem] {
        return component
    }

    static func buildOptional(_ component: [FreezerItem]?) -> [FreezerItem] {
        return component ?? []
    }

    static func buildExpression(_ expression: FreezerItem) -> [FreezerItem] {
        return [expression]
    }

    static func buildExpression(_ expression: ()) -> [FreezerItem] {
        return []
    }

    static func buildBlock(_ freezeritems: [FreezerItem]...) -> [FreezerItem] {
        return freezeritems.flatMap { $0 }
    }
}
