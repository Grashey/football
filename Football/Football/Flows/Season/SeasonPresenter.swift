//
//  SeasonPresenter.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import Foundation

protocol iSeasonPresenter {
    
    var viewModels: [[SeasonViewModel]] {get}
    var headerViewModels: [SeasonHeaderViewModel] {get}
    
    func fetchData()
}

class SeasonPresenter {
    
    var identifier: String?
    weak var controller: SeasonViewController?
    let networkService: iSeasonService
    
    var viewModels: [[SeasonViewModel]] = []
    var headerViewModels: [SeasonHeaderViewModel] = []
    
    init(networkService: iSeasonService) {
        self.networkService = networkService
    }

}

extension SeasonPresenter: iSeasonPresenter {
    
    func fetchData() {
        guard let leagieID = identifier else { return }
        networkService.fetchSeasons(leagueID: leagieID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let data = response.data
                let seasons = data.seasons
                self.headerViewModels = seasons.map { SeasonHeaderViewModel(year: $0.year,
                                                                       startDate: $0.startDate,
                                                                       endDate: $0.endDate,
                                                                       name: $0.name) }
                let types = seasons.map { $0.types }
                self.viewModels = types.map { $0.map { SeasonViewModel(name: $0.name,
                                                                       abbr: $0.abbr,
                                                                       startDate: $0.startDate,
                                                                       endDate: $0.endDate,
                                                                       hasStandings: $0.hasStandings)
                }}
                self.controller?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
