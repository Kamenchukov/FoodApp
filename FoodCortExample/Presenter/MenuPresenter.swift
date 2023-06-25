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

final class MenuPresenter: ObservableObject {
    @Published var menu: [MenuModel] = []
    @Published var menuItem: MenuModel?
    @Published var pizzaCategory: [MenuModel] = []
    @Published var drinkCategory: [MenuModel] = []
    @Published var burgerCategory: [MenuModel] = []
    @Published var desertCategory: [MenuModel] = []
    private let service: MenuService
    private var cancellable: AnyCancellable?
    private let router: UnownedRouter<MenuRoute>
    
    init(service: MenuService = MenuServiceImpl(), router: UnownedRouter<MenuRoute>) {
        self.service = service
        self.router = router
    }
    
    func loadAll() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadPizzas()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadBurgers()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.loadDrinks()
          
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.loadDeserts()
        }
    }
    
    func loadPizzas() {
        cancellable = service.getPizza()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] menuData in
                guard let self else { return }
                self.pizzaCategory = menuData
                self.menu = menuData
                
                print(menuData)
            })
    }
    
    func loadBurgers() {
        cancellable = service.getBurgers()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] menuData in
                guard let self else { return }
                self.burgerCategory = menuData
                
                print(menuData)
            })
    }
    
    func loadDeserts() {
        cancellable = service.getDeserts()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] menuData in
                guard let self else { return }
                self.desertCategory = menuData
                
                print(menuData)
            })
    }
    
    func loadDrinks() {
        cancellable = service.getDrinks()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] menuData in
                guard let self else { return }
                self.drinkCategory = menuData
                
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
