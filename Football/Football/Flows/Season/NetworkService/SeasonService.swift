//
//  SeasonService.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import Foundation

protocol iSeasonService {

    func fetchSeasons(leagueID: String, completion: @escaping (Result<SeasonResponse, Error>) -> Void)
}

class SeasonService: iSeasonService {

    let httpClient: iHTTPClient
    let requestBuilder: iRequestBuilder

    init(httpClient: iHTTPClient, requestBuilder: iRequestBuilder) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchSeasons(leagueID: String, completion: @escaping (Result<SeasonResponse, Error>) -> Void) {
        let request = requestBuilder.makeRequest(route: SeasonRoute.league(leagueID))
        httpClient.request(request: request, completion: completion)
    }
    
}
