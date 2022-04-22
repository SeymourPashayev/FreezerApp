////
////  AppSidebarNavigationCoach.swift
////  myCoach
////
////  Created by Seymour Pashayev on 1/28/22.
////
//
//import SwiftUI
//
//struct AppSidebarNavigationCoach: View {
//    
//    enum NavigationItem {
//        case dashboard
//        case trainees
//        case backlog
//    }
//    
//    //@EnvironmentObject private var model: Model
//    @State private var selection: NavigationItem? = .dashboard
//    
//    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(tag: NavigationItem.dashboard, selection: $selection) {
//                    DashboardView()
//                } label: {
//                    Label("-", systemImage: "list.bullet")
//                }
//                
//                NavigationLink(tag: NavigationItem.trainees, selection: $selection) {
//                    TraineesView()
//                } label: {
//                    Label("Trainees", systemImage: "list.number")
//                }
//            
//                NavigationLink(tag: NavigationItem.backlog, selection: $selection) {
//                    BacklogView()
//                } label: {
//                    Label("Backlog", systemImage: "book.closed")
//                }
//            }
//            .navigationTitle("myCoach")
//            
//            
//        }
//    }
//}
//
//
//struct AppSidebarNavigationCoach_Previews: PreviewProvider {
//    static var previews: some View {
//        AppSidebarNavigationCoach()
//    }
//}
//
//
