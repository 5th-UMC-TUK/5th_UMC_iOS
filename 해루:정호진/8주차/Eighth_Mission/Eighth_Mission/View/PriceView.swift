//
//  PriceView.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/20/23.
//

import SwiftUI

struct PriceView: View {
    @Binding var priceList: [Price]
    @State var viewModel: ViewModel
    @State var selection: Price?
    
    var body: some View {
        VStack {
            HStack {
                Text("가격")
                Spacer()
                Text("필수")
            }
            
            ForEach(priceList) { item in
                createPriceItem(check: item == selection ? true: false,
                                item: item)
                .onTapGesture {
                    if item != selection {
                        viewModel.totalMoney += item.price
                        viewModel.totalMoney -= selection?.price ?? 0
                        viewModel.itemSize = item
                        selection = item
                    }
                }
            }
        }
    }
}

extension PriceView {
    /// 가격 내부 아이템 View 생성
    /// - Parameters:
    ///   - size: Item Size ex) S, M, L
    ///   - price: Item Price
    /// - Returns: Price Item View
    @ViewBuilder
    private func createPriceItem(check: Bool, item: Price) -> some View {
        HStack {
            if check {
                Image(systemName: "circle.fill")
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            } else {
                Image(systemName: "circle")
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            
            Text(item.size)
            Spacer()
            Text("\(item.price)원")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
