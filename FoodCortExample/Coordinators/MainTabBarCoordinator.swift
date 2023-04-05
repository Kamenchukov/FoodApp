//
//  MainTabBarCoordinator.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import UIKit
import XCoordinator
import SwiftUI

enum TabBarRoute: Route {
    case menu
    case contacts
    case profile
    case basket
}

class MainTabBarCoordinator: TabBarCoordinator<TabBarRoute> {
    
    private let menuRouter: StrongRouter<MenuRoute>
    private let contactsRouter: StrongRouter<ContactsRoute>
    private let profileRouter: StrongRouter<ProfileRoute>
    private let basketRouter: StrongRouter<BasketRoute>
    
    convenience init() {
        UITabBar.appearance().tintColor = UIColor(CustomColors.magentaMenu)

        let menuCoordinator = MenuCoordinator()
        menuCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"), tag: 0)
        
        let contactsCoordinator = ContactsCoordinator()
        contactsCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(systemName: "location.fill"), tag: 1)
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 2)
        
        let basketCoordinator = BasketCoordinator()
        basketCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket.fill"), tag: 3)
        
        self.init(
            menuRouter: menuCoordinator.strongRouter,
            contactsRouter: contactsCoordinator.strongRouter,
            profileRouter: profileCoordinator.strongRouter,
            basketRouter: basketCoordinator.strongRouter
        )
    }
    
    init(
        menuRouter: StrongRouter<MenuRoute>,
        contactsRouter: StrongRouter<ContactsRoute>,
        profileRouter: StrongRouter<ProfileRoute>,
        basketRouter: StrongRouter<BasketRoute>
    ) {
        self.menuRouter = menuRouter
        self.contactsRouter = contactsRouter
        self.profileRouter = profileRouter
        self.basketRouter = basketRouter
        super.init(tabs: [menuRouter, contactsRouter, profileRouter, basketRouter], select: menuRouter)
    }
    
    override func prepareTransition(for route: TabBarRoute) -> TabBarTransition {
        switch route {
            
        case .menu:
            return .none()
        case .contacts:
            return .none()
        case .profile:
            return .none()
        case .basket:
            return .none()
        }
    }
}
