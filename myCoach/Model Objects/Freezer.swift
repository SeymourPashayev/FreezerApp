//
//  Freezer.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/22/22.
//

import Foundation

class Freezer: ObservableObject {
    var freezerName: String;
    
    // Array of FreezerItem Objects
    // @Published to make sure change announcements get sent whenever the items array gets modified.
    @Published var items = [FreezerItem]();
    
    init(freezerName:String){
        self.freezerName = freezerName;
    }
}

