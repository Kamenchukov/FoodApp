//
//  CotegoryView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import SwiftUI

struct CotegoryView: View {
    @ObservedObject var viewModel: MenuViewModel
    @State var show1: Bool = true
    @State var show2: Bool = false
    @State var show3: Bool = false
    @State var show4: Bool = false

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                CategoryViewCell(tapped: $show1, name: "Пицца")
                    .onTapGesture {
                        viewModel.menu = viewModel.pizzaCategory
                        self.show1.toggle()
                        self.show2 = false
                        self.show3 = false
                        self.show4 = false
                }
                
                CategoryViewCell(tapped: $show2, name: "Салаты")
                    .onTapGesture {
                        viewModel.menu = viewModel.tillbehor
                        self.show2.toggle()
                        self.show1 = false
                        self.show3 = false
                        self.show4 = false
                    }
                
                CategoryViewCell(tapped: $show3, name: "Напитки")
                    .onTapGesture {
                        viewModel.menu = viewModel.drinkCategory
                        self.show3.toggle()
                        self.show1 = false
                        self.show2 = false
                        self.show4 = false
                    }
                CategoryViewCell(tapped: $show4, name: "Все")
                    .onTapGesture {
                        viewModel.menu = viewModel.allMenu
                        self.show4.toggle()
                        self.show1 = false
                        self.show2 = false
                        self.show3 = false
                    }
            }
          
        }
        .padding(.leading)
    }
}
