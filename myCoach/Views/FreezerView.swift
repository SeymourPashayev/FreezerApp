//
//  FreezerView.swift
//  FreezerApp
//
//  Created by Seymour Pashayev on 4/21/22.
//

import SwiftUI

struct FreezerView: View {
    
    // Array that holds freezerItems (Freezer)
    @StateObject var freezer = Freezer(freezerName: "Freezer");
    
    var body: some View {
        NavigationView{
            List{
                ForEach(freezer.items) { item in
                    Text(item.title);
                }
                .onDelete(perform: freezer.removeItems)
            }
        }
        .navigationTitle("Freezer")
        .toolbar{
            Button {
                freezer.addTestItem();
            } label: {
                Image(systemName: "plus");
            }
        }
    }
    
    // FIXME: There's a UI error that I cannot understand when you open FreezerView on the phone. It does not happen on canvas
    // It might have something to do with having two navigation views overlapping: one in FreezerView and the other in the AppTabNavigationCoach/ContentView
    
}

struct FreezerView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerView()
    }
}
