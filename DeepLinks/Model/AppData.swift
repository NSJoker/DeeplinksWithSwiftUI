//
//  AppData.swift
//  DeepLinks
//
//  Created by Chandrachudh K on 12/04/23.
//

import Foundation
import Combine

class AppData: ObservableObject {
    @Published var activeTab: Tab = .home
    @Published var homeStack: [HomeStack] = []
    @Published var favStack: [FavoritesStack] = []
    @Published var settingsStack: [SettingsStack] = []
}
