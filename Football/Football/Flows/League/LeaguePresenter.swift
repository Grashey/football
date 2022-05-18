//
//  LeaguePresenter.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

protocol iLeaguePresenter {}

class LeaguePresenter {
    
    weak var controller: LeagueViewController?
    let networkService: iLeagueService
    
    init(networkService: iLeagueService) {
        self.networkService = networkService
    }
}

extension LeaguePresenter: iLeaguePresenter {}
