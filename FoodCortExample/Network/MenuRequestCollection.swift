//
//  MenuRequestCollection.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//
import Foundation
import Moya

enum MenuRequestCollection {
    case getMenu
}

extension MenuRequestCollection: TargetType {
    var baseURL: URL {
        URL(string: "https://private-anon-d301776f42-pizzaapp.apiary-mock.com/restaurants")!
    }
    
    var path: String {
        switch self {
        case .getMenu:
            return "/restaurantId/menu"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMenu:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMenu:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
