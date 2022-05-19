//
//  LeagueAssembly.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import UIKit

class LeagueAssembly {
    
    func build() -> UIViewController {
        let httpService = HTTPClient()
        let requestBuilder = RequestBuilder()
        let networkService = LeagueService(httpClient: httpService, requestBuilder: requestBuilder)
        let presenter = LeaguePresenter(networkService: networkService)
        let controller = LeagueViewController()
        controller.presenter = presenter
        presenter.controller = controller
        return controller
    }
}
