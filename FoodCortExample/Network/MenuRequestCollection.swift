//
//  MenuRequestCollection.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//
import Foundation
import Moya

enum MenuRequestCollection {
    case getPizza
    case getBurgers
    case getDeserts
    case getDrinks
}

extension MenuRequestCollection: TargetType {
    var baseURL: URL {
        URL(string: "https://free-food-menus-api-production.up.railway.app")!
    }
    
    var path: String {
        switch self {
        case .getPizza:
            return "/pizzas"
        case .getBurgers:
            return "/burgers"
        case .getDeserts:
            return "/desserts"
        case .getDrinks:
            return "/drinks"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPizza, .getBurgers, .getDeserts, .getDrinks:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getPizza:
            return .requestPlain
        case .getBurgers:
            return .requestPlain
        case .getDeserts:
            return .requestPlain
        case .getDrinks:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
