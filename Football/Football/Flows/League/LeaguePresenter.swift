//
//  LeaguePresenter.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

protocol iLeaguePresenter {
    
    func fetchData()
}

class LeaguePresenter {
    
    weak var controller: LeagueViewController?
    let networkService: iLeagueService
    
    var viewModels: [LeagueViewModel] = []
    
    init(networkService: iLeagueService) {
        self.networkService = networkService
    }
    
    private func logoLink(league: LeagueData) -> String {
        if controller?.traitCollection.userInterfaceStyle == .dark {
            return league.logos.dark
        } else {
            return league.logos.light
        }
    }
    
}

extension LeaguePresenter: iLeaguePresenter {
    
    func fetchData() {
        networkService.fetchLeagues { result in
            switch result {
            case .success(let response):
                let leaguesData = response.data
                self.viewModels = leaguesData.map { LeagueViewModel(name: $0.name,
                                                                 abbr: $0.abbr,
                                                                 logoLink: self.logoLink(league: $0))
                }
                print(self.viewModels)
            case .failure(let error):
                print(error) // тут должен быть алерт
            }
        }
    }
    
}
