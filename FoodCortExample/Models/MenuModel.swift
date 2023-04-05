//
//  MenuModel.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import Foundation

struct MenuModel: Codable,Identifiable {
    let id: Int
    let category: String
    let name: String
    let topping: [String]?
    let price: Int
    let rank: Int?
}
