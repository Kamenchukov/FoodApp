//
//  MenuService.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import Foundation
import Moya
import Combine
import CombineMoya

protocol MenuService {
    func getPizza() -> AnyPublisher<[MenuModel], MoyaError>
    func getBurgers() -> AnyPublisher<[MenuModel], MoyaError>
    func getDeserts() -> AnyPublisher<[MenuModel], MoyaError>
    func getDrinks() -> AnyPublisher<[MenuModel], MoyaError>
}

class MenuServiceImpl: MenuService {
    private let provider = MoyaProvider<MenuRequestCollection>()
    
    func getBurgers() -> AnyPublisher<[MenuModel], Moya.MoyaError> {
        let decoder = JSONDecoder()

        return provider.requestPublisher(.getBurgers)
            .map([MenuModel].self, using: decoder)
            .eraseToAnyPublisher()
    }
    
    func getDeserts() -> AnyPublisher<[MenuModel], Moya.MoyaError> {
        let decoder = JSONDecoder()

        return provider.requestPublisher(.getDeserts)
            .map([MenuModel].self, using: decoder)
            .eraseToAnyPublisher()
    }
    
    func getDrinks() -> AnyPublisher<[MenuModel], Moya.MoyaError> {
        let decoder = JSONDecoder()

        return provider.requestPublisher(.getDrinks)
            .map([MenuModel].self, using: decoder)
            .eraseToAnyPublisher()
    }
    
    func getPizza() -> AnyPublisher<[MenuModel], Moya.MoyaError> {
        let decoder = JSONDecoder()

        return provider.requestPublisher(.getPizza)
            .map([MenuModel].self, using: decoder)
            .eraseToAnyPublisher()
    }

}

