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
        case dashboard
        case trainees
        case backlog
    }
    
    @State private var selection: Tab = .dashboard
    
    var body: some View {
        TabView(selection: $selection){
            
            // Dashboard Navigation
            NavigationView {
                DashboardView()
            }
            .tabItem{
                let menuText = Text("Dashboard", comment: "General Overview")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "list.bullet")
                }
            }
            .tag(Tab.dashboard)
            
            
            // Trainees Navigation
            NavigationView {
                TraineesView()
            }
            .tabItem{
                let menuText = Text("Trainees", comment: "List of Trainees")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "list.bullet")
                }
            }
            .tag(Tab.trainees)
            
            // Backlog Navigation
            NavigationView {
                BacklogView()
            }
            .tabItem{
                let menuText = Text("Backlog", comment: "List of Workouts(Exer.)")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "list.bullet")
                }
            }
            .tag(Tab.backlog)
            
        }
    }
}

struct AppTabNavigationCoach_Previews: PreviewProvider {
    static var previews: some View{
        AppTabNavigationCoach()
    }
}
