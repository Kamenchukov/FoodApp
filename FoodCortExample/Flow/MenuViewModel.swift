//
//  MenuViewModel.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import Foundation
import XCoordinator
import SwiftUI
import Combine

final class MenuViewModel: ObservableObject {
    @Published var menu: [MenuModel] = []
    @Published var menuItem: MenuModel?
    @Published var allMenu: [MenuModel] = []
    @Published var pizzaCategory: [MenuModel] = []
    @Published var drinkCategory: [MenuModel] = []
    @Published var tillbehor: [MenuModel] = []
    private let service: MenuService
    private var cancellable: AnyCancellable?
    private let router: UnownedRouter<MenuRoute>
    
    init(service: MenuService = MenuServiceImpl(), router: UnownedRouter<MenuRoute>) {
        self.service = service
        self.router = router
    }
    
    func loadMenu() {
        cancellable = service.getMenu()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] menuData in
                guard let self else { return }
                self.allMenu = menuData
                
                for i in allMenu {
                    if i.category == "Pizza" {
                        pizzaCategory.append(i)
                        menu.append(i)
                    }
                }
                
                for i in allMenu {
                    if i.category == "Tillbehör" {
                        tillbehor.append(i)
                    }
                }
                
                for i in allMenu {
                    if i.category == "Dryck" {
                        drinkCategory.append(i)
                    }
                }
                print(menuData)
            })
    }
    
    func showMenu() {
        router.trigger(.menu)
    }
    
    func showGoods() {
        router.trigger(.goods)
    }
}
