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

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let controller = LeagueViewController()
        controller.view.backgroundColor = .yellow

        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
    }

}
