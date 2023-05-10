//
//  Tab.swift
//  DeepLinks
//
//  Created by Chandrachudh K on 12/04/23.
//

import Foundation

enum Tab: String, StringToEnumConvertible {
    case home = "Home"
    case favorite = "Favorites"
    case settings = "Settings"
    
    var symbolImage: String {
        switch self {
        case .home:
            return "house.fill"
        case .favorite:
            return  "heart.fill"
        case .settings:
            return "gear"
        }
    }
}

protocol StringToEnumConvertible: CaseIterable {
    static func convert(from: String) -> Self?
}

extension StringToEnumConvertible where Self: RawRepresentable, Self.RawValue == String {
    static func convert(from: String) -> Self? {
        return Self.allCases.first { item in
            item.rawValue.lowercased() == from.lowercased()
        }
    }
}
