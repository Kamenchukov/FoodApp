//
//  BannersView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import SwiftUI

struct BannersView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
            ForEach(0..<2) { data in
                    BannerViewCell()
                }
            }
        }
    }
}

struct BannersView_Previews: PreviewProvider {
    static var previews: some View {
        BannersView()
    }
}
