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
    func getMenu() -> AnyPublisher<[MenuModel], MoyaError>
}

class MenuServiceImpl: MenuService {
    private let provider = MoyaProvider<MenuRequestCollection>()
    
    func getMenu() -> AnyPublisher<[MenuModel], Moya.MoyaError> {
        let decoder = JSONDecoder()

        return provider.requestPublisher(.getMenu)
            .map([MenuModel].self, using: decoder)
            .eraseToAnyPublisher()
    }

}
