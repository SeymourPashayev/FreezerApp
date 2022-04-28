//
//  FreezerAddItemView.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/25/22.
//

import Foundation
import SwiftUI

struct FreezerAddItemView: View {
    
    @Environment(\.dismiss) var dismiss
    func leaveScreen(){
        // Create an item from data collected
        let item = FreezerItem(title: title, expirationDate: expDate)
        
        // Add the item to the sharedObject freezer array
        freezer.items.append(item)
    }
    
    // State variables
    @State private var title = "";
    @State private var expDate = "";
    
    @EnvironmentObject var freezer: Freezer;
    
    
    var body: some View {
            VStack{
                Form{
                    TextField("Title", text: $title)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                    TextField("ExpirationDate", text: $expDate)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarTitle("Add an Item")
         
            .onDisappear{
         leaveScreen()
         dismiss()
         }
                
    }
}


struct FreezerAddItemView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerAddItemView()
    }
}

