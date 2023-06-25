//
//  MenuCoordinator.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import UIKit
import XCoordinator
import SwiftUI

enum MenuRoute: Route {
    case menu
    case goods
}

class MenuCoordinator: NavigationCoordinator<MenuRoute> {
    init() {
        super.init(initialRoute: .menu)
    }
    
    override func prepareTransition(for route: MenuRoute) -> NavigationTransition {
        switch route {
            
        case .menu:
            return .push(buildMenuScreen())
        case .goods:
            return .none()
        }
    }
    
    private func buildMenuScreen() -> UIViewController {
        let presenter = MenuPresenter(router: unownedRouter)
        let view = MenuScreenView(presenter: presenter)
        return UIHostingController(rootView: view)
    }
}
