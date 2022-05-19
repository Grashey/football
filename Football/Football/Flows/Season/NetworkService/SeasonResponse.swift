//
//  SeasonResponse.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import Foundation

struct SeasonResponse: Codable {
    
    let status: Bool
    let data: SeasonData
}

struct SeasonData: Codable {
    
    let desc: String
    let seasons: [Season]
}

struct Season: Codable {
    
    let year: Int
    let startDate: String
    let endDate: String
    let name: String
    let types: [SeasonType]
    
    enum CodingKeys: String, CodingKey {
        case name = "displayName"
        case year, startDate, endDate, types
    }
}

struct SeasonType: Codable {
    
    let identifier: String
    let name: String
    let abbr: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case abbr = "abbreviation"
        case name, startDate, endDate, hasStandings
    }
}
