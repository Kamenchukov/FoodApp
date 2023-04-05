//
//  BasketCoordinator.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import UIKit
import XCoordinator
import SwiftUI

enum BasketRoute: Route {
    case basket
}

class BasketCoordinator: NavigationCoordinator<BasketRoute> {
    init() {
        super.init(initialRoute: .basket)
    }
    
    override func prepareTransition(for route: BasketRoute) -> NavigationTransition {
        switch route {
        case .basket:
            return .none()
        }
    }
}
