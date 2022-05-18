//
//  LeagueResponse.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

struct LeagueResponse: Codable {
    
    let status: Bool
    let data: [LeagueData]
    
    struct LeagueData: Codable {
    
        let identifier: String
        let name: String
        let abbr: String
        let logos: Logos
        
        struct Logos: Codable {
            let light: String
            let dark: String
        }
        
        enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case name, abbr, logos
        }
    }
}
