//
//  AppTabNavigationCoach.swift
//  myCoach
//
//  Created by Seymour Pashayev on 1/28/22.
//

/*
Abstract:

Tab based app structure.
*/

import SwiftUI

struct AppTabNavigationCoach: View {
    
    enum Tab{
        case recentlyAdded
        case dashboard
        case freezer
    }
    
    @State private var selection: Tab = .dashboard
    
    var body: some View {
        TabView(selection: $selection){
            
            // Recently Added Navigation
            RecentlyAddedView()
            .tabItem{
                let menuText = Text("Recent", comment: "Recently Added")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "clock")
                }
            }
            .tag(Tab.recentlyAdded)
            
            //! Recently Added Navigation
            
            // Dashboard Navigation
            DashboardView()
            .tabItem{
                let menuText = Text("Dashboard", comment: "List of all items soon to expire")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "house.fill")
                }
            }
            .tag(Tab.dashboard)
            
            //! Dashboard Navigation
            
            
            // FreezerView Navigation
            // Pass the @EnvironmentObject to freezerView
            FreezerView()
            .tabItem{
                let menuText = Text("Freezer", comment: "List of all freezer items")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "snowflake")
                }
            }
            .tag(Tab.freezer)
            
            //! FreezerView Navigation
        }
    }
}

struct AppTabNavigationCoach_Previews: PreviewProvider {
    static var previews: some View{
        AppTabNavigationCoach()
    }
}
