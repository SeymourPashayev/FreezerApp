//
//  FreezerItemView.swift
//  myCoach
//
//  Created by Seymour Pashayev on 4/23/22.
//

import SwiftUI

struct FreezerItemView: View {
    @ObservedObject private var freezerItem = FreezerItem();
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 4.0){
                TextField("Title", text: $freezerItem.title)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(Color.secondary)
                    .cornerRadius(12);
                    
                TextField("Exp-Date", text: $freezerItem.expirationDate)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(Color.secondary)
                    .cornerRadius(12);
            }
            .padding(.horizontal)
        }
        .toolbar{
            Button("Save") {
                //freezerItem.encode(to: freezerItem as! Encoder);
            }
        }
    }
    
    
}
struct FreezerItemView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerItemView()
    }
}
