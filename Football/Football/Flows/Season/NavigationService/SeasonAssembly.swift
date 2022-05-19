//
//  SeasonAssembly.swift
//  Football
//
//  Created by Aleksandr Fetisov on 19.05.2022.
//

import UIKit

class SeasonAssembly {
    
    func build(moduleInput: ModuleInput? = nil) -> UIViewController {
        let httpService = HTTPClient()
        let requestBuilder = RequestBuilder()
        let networkService = SeasonService(httpClient: httpService, requestBuilder: requestBuilder)
        let presenter = SeasonPresenter(networkService: networkService)
        let controller = SeasonViewController()
        if let moduleInput = moduleInput as? SeasonModuleInput {
            presenter.identifier = moduleInput.identifier
            controller.title = moduleInput.title
        } else {
            assertionFailure("ModuleInput Not Found")
        }
        controller.presenter = presenter
        presenter.controller = controller
        return controller
    }
}
