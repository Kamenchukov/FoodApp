//
//  CategoryViewCell.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import SwiftUI

struct CategoryViewCell: View {
    @Binding var tapped: Bool
    var name: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 88, height: 32)
                .foregroundColor(tapped ? CustomColors.selectedBacground : CustomColors.unselectedBackground)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(CustomColors.selectedBacground, lineWidth: 1)
                }
            Text(name)
                .foregroundColor(tapped ? CustomColors.magentaMenu : CustomColors.selectedBacground)
        }
    }
}
