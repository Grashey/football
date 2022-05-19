//
//  SeasonRoute.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import Foundation

enum SeasonRoute {
    case league(String)
}

extension SeasonRoute: Route {

    var url: String {
        switch self {
        case .league(let identifier):
            return "/leagues/\(identifier)/seasons"
        }
    }
}
