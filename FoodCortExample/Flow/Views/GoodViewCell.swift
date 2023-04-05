//
//  GoodViewCell.swift
//  FoodCortExample
//
//  Created by Константин Каменчуков on 04.04.2023.
//

import SwiftUI

struct GoodViewCell: View {
    private let menuItem: MenuModel
    
    init(menuItem: MenuModel) {
        self.menuItem = menuItem
    }
    var body: some View {

            HStack(spacing: 32) {
                Spacer()
                Image("under")
                    .resizable()
                    .frame(width: 132,height: 132)
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                    .padding(.leading, 16)
                VStack(alignment: .trailing, spacing: 8) {
                    Text(menuItem.name)
                        .frame(maxWidth: 168)
                        .font(.system(size: 17, weight: .semibold))
                        
                    Text(menuItem.topping?.joined(separator: ", ") ?? "")
                        .frame(maxWidth: 168)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.gray)
                 
                     
                        Button {
                            print("buy")
                        } label: {
                            Text("от \(menuItem.price) P")
                                .font(.system(size: 13, weight: .regular))
                                .foregroundColor(CustomColors.magentaMenu)
                                .frame(width: 52, height: 16)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(CustomColors.magentaMenu, lineWidth: 1)
                                }
                        }
                }
                Spacer()
            }
            .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

struct GoodViewCell_Previews: PreviewProvider {
    static var previews: some View {
        GoodViewCell(menuItem: MenuModel(id: 1, category: "пицца", name: "Пеперони", topping: ["хлеб","масло","пеперони","оливки","ананас"], price: 32, rank: 4))
    }
}
