//
//  Route.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

protocol Route {

    var method: String { get }

    var url: String { get }

    var baseURL: String { get }

    var parameters: [String: Int] { get }

    func makeURL() -> String
}

extension Route {

    var method: String { "GET" }
    
    var baseURL: String { "https://api-football-standings.azharimm.site" }

    var parameters: [String: Int] { [:] }

    func makeURL() -> String {
       baseURL.appending(url)
    }

}
