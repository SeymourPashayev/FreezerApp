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
                        .padding(.all)
                        
                    TextField("ExpirationDate", text: $expDate)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                }
                .navigationBarTitle("Edit Item")
                // Load the item data into the view as it appears
                .onDisappear{
                    leaveScreen()
                    // Dismiss the sheet with the help of the @Environment
                    dismiss()
                }
            } .onLoad{
                fetchItemData()
            }
            
    }
}


struct FreezerItemView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerItemView(freezerItem: FreezerItem())
    }
}

