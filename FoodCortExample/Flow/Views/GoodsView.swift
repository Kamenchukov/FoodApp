//
//  GoodsView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 05.04.2023.
//

import SwiftUI

struct GoodsView: View {
    @ObservedObject var viewModel: MenuViewModel

    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(viewModel.menu) { dat in
                    GoodViewCell(menuItem: dat)
                }.background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }.onAppear {
            viewModel.loadMenu()
        }
        .background(.gray)
    }
}

struct GoodsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodsView(viewModel: MenuViewModel(router: .previewMock()))
    }
}
