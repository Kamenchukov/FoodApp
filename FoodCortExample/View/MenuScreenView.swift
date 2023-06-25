//
//  MenuScreenView.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 03.04.2023.
//

import SwiftUI
import XCoordinator

struct MenuScreenView: View {
    @ObservedObject var presenter: MenuPresenter

    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {

            ZStack {
                VStack(spacing: 0) {
                    ForEach(presenter.menu) { dat in
                        GoodViewCell(menuItem: dat)
                    }.background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                    .padding(.top, 170)
                    GeometryReader { gr in
                        VStack {
                            HeaderView(presenter: presenter)
                                .background(CustomColors.unselectedBackground)
                                .frame(height: self.calculateHeight(minHeight: 120, maxHeight: 240, yOffset: gr.frame(in: .global).origin.y))
                                .offset(y: gr.frame(in: .global).origin.y < 0
                                        ? abs(gr.frame(in: .global).origin.y)
                                        : -gr.frame(in: .global).origin.y)
                           Spacer()
                        }
                    }
            }.background(CustomColors.unselectedBackground)
        }
        .navigationBarColor(backgroundColor: CustomColors.unselectedBackground, titleColor: .black)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    print("Change country")
                } label: {
                    HStack {
                        Text("Москва")
                        Image(systemName: "chevron.down")
                    }.font(.system(size: 17))
                     .foregroundColor(.black)
                    
                }
            }
        }
        .onAppear() {
            presenter.loadAll()
            
        }
    }
    
    func calculateHeight(minHeight: CGFloat, maxHeight: CGFloat, yOffset: CGFloat) -> CGFloat {
        if maxHeight + yOffset < minHeight {
            return minHeight
        }
        return maxHeight + yOffset
    }
}

struct MenuScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView(presenter: MenuPresenter(router: .previewMock()))
    }
}
