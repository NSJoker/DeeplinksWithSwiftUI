//
//  DeepLinksApp.swift
//  DeepLinks
//
//  Created by Chandrachudh K on 12/04/23.
//

import SwiftUI

@main
struct DeepLinksApp: App {
    // Creating a state object that contains all the app data and passes it via Environment Object
    @StateObject private var appData: AppData = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL { url in
                    let string = url.absoluteString.replacingOccurrences(of: "myapp://", with: "")
                    // Splitting URL components
                    let components = string.components(separatedBy: "?")
                    
                    for component in components {
                        if component.contains("tab=") {
                            // We have tab change request
                            let rawTabValue = component.replacingOccurrences(of: "tab=", with: "")
                            if let requestedTab = Tab.convert(from: rawTabValue) {
                                appData.activeTab = requestedTab
                            }
                        }
                        
                        // we need inner navigation specifics to navigate to the inner stacks
                        if component.contains("nav=") && string.contains("tab") {
                            let requestedPath = component
                                .replacingOccurrences(of: "nav=", with: "")
                                .replacingOccurrences(of: "_", with: " ")
                            
                            switch appData.activeTab {
                            case .home:
                                if let navPath = HomeStack.convert(from: requestedPath) {
                                    appData.homeStack.append(navPath)
                                }
                            case .favorite:
                                if let navPath = FavoritesStack.convert(from: requestedPath) {
                                    appData.favStack.append(navPath)
                                }
                            case .settings:
                                if let navPath = SettingsStack.convert(from: requestedPath) {
                                    appData.settingsStack.append(navPath)
                                }
                            }
                        }
                    }
                }
        }
    }
}
