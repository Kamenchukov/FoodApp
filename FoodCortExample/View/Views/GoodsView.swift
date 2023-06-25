//
//  GoodsView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 05.04.2023.
//

import SwiftUI

struct GoodsView: View {
    @ObservedObject var presenter: MenuPresenter

    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(presenter.menu) { dat in
                    GoodViewCell(menuItem: dat)
                }.background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .background(.gray)
    }
}

struct GoodsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodsView(presenter: MenuPresenter(router: .previewMock()))
    }
}
