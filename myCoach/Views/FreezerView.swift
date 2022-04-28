//
//  FreezerView.swift
//  FreezerApp
//
//  Created by Seymour Pashayev on 4/21/22.
//

import SwiftUI



struct FreezerView: View {
    
    // Array that holds freezerItems (Freezer)
    // @StateOobject creates an instance that could be
    // @EnvironmentObject in another view. @EO cannot be intsantiated
    @StateObject var freezer = Freezer(freezerName: "Freezer")
    
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(freezer.items.indexed()) { indexedItem in
                        VStack{
                            NavigationLink(destination: FreezerItemView(freezerItem: indexedItem.element)) {
                                Text(indexedItem.title)
                            }
                        }
                    }
                    .onDelete(perform: freezer.removeItems)
                }
                
                NavigationLink(destination: FreezerAddItemView().environmentObject(freezer)){
                    Text("ADD ITEM")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)

                }
                .padding(.all)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 2, alignment: .center)
                    .padding(.horizontal, 4)
                    .padding(.bottom, 8)
                    .cornerRadius(16)
                
            }.navigationBarTitle(freezer.freezerName);
            
        }.environmentObject(freezer)
    }
}
struct FreezerView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerView().environmentObject(Freezer())
    }
}
