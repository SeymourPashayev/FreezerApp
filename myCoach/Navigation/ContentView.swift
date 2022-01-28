//
//  ContentView.swift
//  myCoach
//
//  Created by Seymour Pashayev on 1/28/22.
//

import SwiftUI


struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            AppTabNavigationCoach()
        } else {
            AppSidebarNavigationCoach()
        }
        #else
        AppSidebarNavigationCoach()
        #endif
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
