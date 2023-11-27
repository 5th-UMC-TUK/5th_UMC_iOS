//
//  PriceItemView.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/20/23.
//

import SwiftUI

struct OptionView: View {
    @Binding var optionList: [Option]
    @State var viewModel: ViewModel
    @State var selection: [Option]
    
    var body: some View {
        VStack {
            HStack {
                Text("소스 추가")
                Spacer()
                Text("선택")
            }
            
            ForEach(optionList) { item in
                createOptionItem(check: selection.contains(item), item: item)
            }
        }
    }
}

extension OptionView {
    /// 소스 추가 옵션들 생성
    /// - Parameters:
    ///   - check: 선택한 옵션인지 확인
    ///   - item: 각 소스들
    /// - Returns: Option 내부 View
    @ViewBuilder
    private func createOptionItem(check: Bool, item: Option) -> some View {
        Button(action: { print("calledhere")}, label: {
            HStack {
                if check {
                    Image(systemName: "circle.fill")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                } else {
                    Image(systemName: "circle")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                
                Text(item.title)
                Spacer()
                Text("+\(item.price)원")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        })
        .onTapGesture {
            
            if selection.contains(item) {
                selection.remove(at: selection.firstIndex(of: item) ?? 0)
                viewModel.totalMoney -= item.price
            } else {
                selection.append(item)
                viewModel.totalMoney += item.price
            }
            
            if viewModel.checkOptions.contains(item) {
                viewModel.checkOptions.remove(at: viewModel.checkOptions.firstIndex(of: item) ?? 0)
            } else {
                viewModel.checkOptions.append(item)
            }
        }
    }
}
