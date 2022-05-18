//
//  LeagueService.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

protocol iLeagueService {

    func fetchLeagues(completion: @escaping (Result<LeagueResponse, Error>) -> Void)
}

class LeagueService: iLeagueService {

    let httpClient: iHTTPClient
    let requestBuilder: iRequestBuilder

    init(httpClient: iHTTPClient = HTTPClient(), requestBuilder: iRequestBuilder = RequestBuilder()) {
        self.httpClient = httpClient
        self.requestBuilder = requestBuilder
    }

    func fetchLeagues(completion: @escaping (Result<LeagueResponse, Error>) -> Void) {
        let request = requestBuilder.makeRequest(route: LeagueRoute.leagues)
        httpClient.request(request: request, completion: completion)
    }
}
