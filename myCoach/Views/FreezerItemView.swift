//
//  FreezerItemView.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/23/22.
//

import SwiftUI

struct FreezerItemView: View {
    
    func leaveScreen(){
        // Save the Data
        pushItemData()
    }
    
    // Load the item data into the view
    func fetchItemData(){
        title = freezerItem.title;
        expDate = freezerItem.expirationDate;
    }
    
    // Save the item data from the view
    func pushItemData(){
        freezerItem.title = title;
        freezerItem.expirationDate = expDate;
    }
    
    @Environment(\.dismiss) var dismiss;
    @EnvironmentObject var freezer: Freezer
    @ObservedObject var freezerItem: FreezerItem;
    
    // State variables
    @State private var title = "";
    @State private var expDate = "";
    
    
    var body: some View {
        VStack{
            Form{
                
                TextField("Title", text: $title)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                TextField("ExpirationDate", text: $expDate)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            }
            // Load the item data into the view as it appears
            .onAppear{
                fetchItemData()
            }.onDisappear{
                leaveScreen()
                // Dismiss the sheet with the help of the @Environment
                dismiss()
            }
        }
    }
}


struct FreezerItemView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerItemView(freezerItem: FreezerItem())
    }
}

