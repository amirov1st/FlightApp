//
//  ContentView.swift
//  FlightApp
//
//  Created by Amirov Foma on 14.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Home")
                }
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
    
}

#Preview {
    ContentView()
}
