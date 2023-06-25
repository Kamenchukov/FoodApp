//
//  CotegoryView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import SwiftUI

struct CotegoryView: View {
    @ObservedObject var presenter: MenuPresenter
    @State var show1: Bool = true
    @State var show2: Bool = false
    @State var show3: Bool = false
    @State var show4: Bool = false

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                CategoryViewCell(tapped: $show1, name: "Пицца")
                    .onTapGesture {
                        presenter.menu = presenter.pizzaCategory
                        self.show1.toggle()
                        self.show2 = false
                        self.show3 = false
                        self.show4 = false
                }
                
                CategoryViewCell(tapped: $show2, name: "Бургеры")
                    .onTapGesture {

                        presenter.menu = presenter.burgerCategory
                        self.show2.toggle()
                        self.show1 = false
                        self.show3 = false
                        self.show4 = false
                    }
                
                CategoryViewCell(tapped: $show3, name: "Напитки")
                    .onTapGesture {

                        presenter.menu = presenter.drinkCategory
                        self.show3.toggle()
                        self.show1 = false
                        self.show2 = false
                        self.show4 = false
                    }
                CategoryViewCell(tapped: $show4, name: "Десерты")
                    .onTapGesture {

                        presenter.menu = presenter.desertCategory
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
