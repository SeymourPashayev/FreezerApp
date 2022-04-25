//
//  FreezerView.swift
//  FreezerApp
//
//  Created by Seymour Pashayev on 4/21/22.
//

import SwiftUI



struct FreezerView: View {
    
    // Array that holds freezerItems (Freezer)
    @EnvironmentObject var freezer: Freezer
    
    
    var body: some View {
        List {
            ForEach(freezer.items.indexed()) { indexedItem in
                VStack{
                    NavigationLink(destination: FreezerItemView(freezerItem: indexedItem.element).environmentObject(freezer)) {
                        Text(indexedItem.title)
                    }
                }
            }
            .onDelete(perform: freezer.removeItems)
        }
        .toolbar{
            NavigationLink(destination: FreezerAddItemView().environmentObject(freezer)){
                Image(systemName: "plus");
            }
        }
        
    }
}
struct FreezerView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerView()
    }
}
