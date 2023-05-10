//
//  Home.swift
//  DeepLinks
//
//  Created by Chandrachudh K on 12/04/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var appData: AppData
    
    var body: some View {
        TabView(selection: $appData.activeTab) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: Tab.home.symbolImage)
                }
            
            FavoritesView()
                .tag(Tab.favorite)
                .tabItem {
                    Image(systemName: Tab.favorite.symbolImage)
                }
            
            SettingsView()
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: Tab.settings.symbolImage)
                }
        }
        .tint(.red)
    }
    
    // Home With nav view
    @ViewBuilder
    func HomeView() -> some View {
        NavigationStack(path: $appData.homeStack) {
            List {
                ForEach(HomeStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) { link in
                Text(link.rawValue + "  View")
            }
        }
    }
    
    // Favorites With nav view
    @ViewBuilder
    func FavoritesView() -> some View {
        NavigationStack(path: $appData.favStack) {
            List {
                ForEach(FavoritesStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationDestination(for: FavoritesStack.self) { link in
                Text(link.rawValue + "  View")
            }
        }
    }
    
    // Home With nav view
    @ViewBuilder
    func SettingsView() -> some View {
        NavigationStack(path: $appData.settingsStack) {
            List {
                ForEach(SettingsStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingsStack.self) { link in
                Text(link.rawValue + "  View")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData())
    }
}
