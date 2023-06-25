//
//  HeaderView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 05.04.2023.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var presenter: MenuPresenter
    var body: some View {
        VStack(spacing: 8) {
            BannersView()
            CotegoryView(presenter: presenter)
                .padding(.bottom, 10)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(presenter: MenuPresenter(router: .previewMock()))
    }
}
