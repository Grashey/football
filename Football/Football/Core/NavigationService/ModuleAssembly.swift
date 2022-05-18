//
//  ModuleAssembly.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import UIKit

protocol iModuleAssembly {
    
    func build(_ moduleName: ModuleName) -> UIViewController
}

class ModuleAssembly {}

extension ModuleAssembly: iModuleAssembly {
    
    func build(_ moduleName: ModuleName) -> UIViewController {
        switch moduleName {
        case .league: return LeagueAssembly().build()
        }
    }
}
