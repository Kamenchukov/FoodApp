//
//  BannerViewCell.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import SwiftUI

struct BannerViewCell: View {
    var body: some View {
        Image("banner")
            .resizable()
            .frame(width: 300, height: 112)
            .cornerRadius(10)
    }
}

struct BannerViewCell_Previews: PreviewProvider {
    static var previews: some View {
        BannerViewCell()
    }
}
