//
//  LeagueRoute.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

enum LeagueRoute {
    case leagues
}

extension LeagueRoute: Route {

    var url: String {
        switch self {
        case .leagues:
            return "/leagues"
        }
    }
}
