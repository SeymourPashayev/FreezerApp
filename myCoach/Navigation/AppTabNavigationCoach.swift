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
            
            // Dashboard Navigation
            NavigationView {
                RecentlyAddedView()
            }
            .tabItem{
                let menuText = Text("Recent", comment: "Recently Added")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "clock")
                }
            }
            .tag(Tab.recentlyAdded)
            
            
            // Trainees Navigation
            NavigationView {
                DashboardView()
            }
            .tabItem{
                let menuText = Text("Dashboard", comment: "List of all items soon to expire")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "house.fill")
                }
            }
            .tag(Tab.dashboard)
            
            // Backlog Navigation
            NavigationView {
                FreezerView()
            }
            .tabItem{
                let menuText = Text("Freezer", comment: "List of all freezer items")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "snowflake")
                }
            }
            .tag(Tab.freezer)
            
        }
    }
}

struct AppTabNavigationCoach_Previews: PreviewProvider {
    static var previews: some View{
        AppTabNavigationCoach()
    }
}
