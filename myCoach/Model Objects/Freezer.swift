//
//  Freezer.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/22/22.
//

// Test comment to see if git worked

import Foundation

class Freezer: ObservableObject, Codable {
    var freezerName: String;
    
    // Array of FreezerItem Objects
    // @Published to make sure change announcements get sent whenever the items array gets modified.
    @Published var items = [FreezerItem]() {
        didSet {
            // whatever that code does, it is supposed to save user data lol
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init(){
        self.freezerName = "Freezer";
    }
    
    init(freezerName:String){
        self.freezerName = freezerName;
    }
    
    
    /** Adds a test item to the list of items. For debugging */
    func addTestItem(){
        let testItem = FreezerItem(title:"testItem", expirationDate: "testExpirationDate");
        self.items.append(testItem);
    }
    
    /** Adds an item to the fridge with the provided details*/
    func addItem(title: String, expirationDate: String){
        let itemToAdd = FreezerItem(title: title, expirationDate: expirationDate);
        self.items.append(itemToAdd);
    }
    
    //TODO: Add a view that would take input from user and add it into freezerItem
    //TODO: Add a view that would let you open a freezer item, edit it and delete it.
    //TODO: Figure out how to store data across app reloads: look into iExpense app on HackingWithSwift website.
    
    /**
     Removes items from the fridge at an offset
     */
    func removeItems(at offsets: IndexSet) {
        self.items.remove(atOffsets: offsets)
    }
    
    /**Enumeration Protocol Coding Keys (For Encoding/Saving)**/
    enum CodeKeys: CodingKey{
        case items
    }
    
    /**
     Initializer to load the data back into the app on open.
     */
    required init(from decoder: Decoder){
        self.freezerName = "Freezer";
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([FreezerItem].self, from: savedItems){
                items = decodedItems;
                return;
            }
        }

        items = [];
    }
    
    /** Saves the data with JSON encoder*/
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try container.encode(items, forKey: .items)
    }
    
}

