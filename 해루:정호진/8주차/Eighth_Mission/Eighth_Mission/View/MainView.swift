//
//  MainView.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/20/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                Image("떡꼬치")
                    .resizable()
                    .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
                
                PriceView(priceList: $viewModel.priceList,
                          viewModel: viewModel,
                          selection: viewModel.itemSize)
                    .frame(minHeight: 200)
                    .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                
                OptionView(optionList: $viewModel.optionList, 
                           viewModel: viewModel,
                           selection: viewModel.checkOptions)
                    .frame(minHeight: 320)
                    .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                    
            }
            .listStyle(.plain)
            
            ZStack(alignment: .bottom) {
                NavigationLink(destination: CartView(options: viewModel.optionList, 
                                                     price: viewModel.itemSize,
                                                     total: viewModel.totalMoney + (viewModel.itemSize?.price ?? 0)), label: {
                    HStack{
                        if viewModel.totalMoney + (viewModel.itemSize?.price ?? 0) != 0 {
                            Text("\(viewModel.totalMoney + (viewModel.itemSize?.price ?? 0))")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -5))
                        }
                        Text("담기")
                    }
                })
            }
        }
    }
}

extension MainView {
    /// Header View
    /// - Returns: Header
    @ViewBuilder
    private func headerView() -> some View {
        Color.gray
    }
    
 
}

#Preview {
    MainView()
}
