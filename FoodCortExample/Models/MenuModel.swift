//
//  MenuModel.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import Foundation

struct MenuModel: Codable,Identifiable {
    let id: String
    let img: URL?
    let name: String?
    let dsc: String?
    let price: Double?
    let rate: Int?
    let country: String?
}
