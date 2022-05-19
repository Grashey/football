//
//  RootCoordinator.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import UIKit

protocol iCoordinator {
    
    func start()
}

class RootCoordinator: iCoordinator {

    let window: UIWindow?
    var navigationController: UINavigationController?
    let assembly: iModuleAssembly

    init(window: UIWindow?, assembly: iModuleAssembly = ModuleAssembly()) {
        self.window = window
        self.assembly = assembly
    }

    func start() {
        let controller = assembly.build(.league, moduleInput: nil)
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        
        (controller as? LeagueViewController)?.onDetail = { [weak self] title, Identifier in
            guard let self = self else { return }
            let input = SeasonModuleInput(title: title, identifier: Identifier)
            let controller = self.assembly.build(.season, moduleInput: input)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
