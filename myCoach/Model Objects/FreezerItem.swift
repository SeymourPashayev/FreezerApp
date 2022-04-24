//
//  FreezerItem.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/21/22.
//

import Foundation

// FreezerItem Object Itself
class FreezerItem: Identifiable, ObservableObject, Codable{
    var id = UUID();
    @Published var title: String;
    @Published var expirationDate: String;
    //TODO: Figure out a way to use date instead of a string here
    //TODO: Research how barcodes work and how to add an item based on barcode
    
    /**Enumeration Protocol Coding Keys (For Encoding/Saving)**/
    enum CodeKeys: CodingKey{
        case title
        case expirationDate
    }
    
    /**Basic constructor*/
    init(title: String, expirationDate: String){
        self.title = title;
        self.expirationDate = expirationDate;
    }
    
    /**Test init for test item creation with null init**/
    init(){
        self.title = "testItem-NullInit";
        self.expirationDate = "textExpdate-NullInit";
    }
    
    /** Loads the data with JSON decoder */
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodeKeys.self)
        title = try container.decode(String.self, forKey: .title)
        expirationDate = try container.decode(String.self, forKey: .expirationDate)
    }
    
    /** Saves the data with JSON encoder*/
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(expirationDate, forKey: .expirationDate)
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

