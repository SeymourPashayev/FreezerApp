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
                ForEach(freezer.items, id: \.id) { item in
                    Text(item.title);
                }
            }
        }
        .navigationTitle("Freezer")
    }
    
}

struct FreezerView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerView()
    }
}
