//
//  ContactsCoordinator.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import UIKit
import XCoordinator
import SwiftUI

enum ContactsRoute: Route {
    case contacts
}

class ContactsCoordinator: NavigationCoordinator<ContactsRoute> {
    init() {
        super.init(initialRoute: .contacts)
    }
    
    override func prepareTransition(for route: ContactsRoute) -> NavigationTransition {
        switch route {
        case .contacts:
            return .none()
        }
    }
}
