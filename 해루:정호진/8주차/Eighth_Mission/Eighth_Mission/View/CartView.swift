//
//  CartView.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/21/23.
//

import SwiftUI

struct CartView: View {
    @State var options: [Option]
    @State var price: Price?
    @State var total: Int
    
    var body: some View {
        List{
            VStack {
                HStack {
                    Text("떡꼬치")
                        .font(.headline)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
                HStack {
                    Image("떡꼬치")
                        .resizable()
                        .frame(width: 100,height: 100)
                    
                    VStack(alignment: .leading) {
                        Text("가격: \(price?.size ?? "") (\(price?.price ?? 0))")
                        ForEach(options) { option in
                            Text("소스: \(option.title) (\(option.price))")
                        }
                        Text("\(total)원")
                            .font(.headline)
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
            
        }
        .listStyle(.plain)
        
        ZStack(alignment: .bottom) {
            Text("총 금액: \(total) 원")
        }
    }
}

#Preview {
    CartView(options: [Option(title: "꿀", price: 8000),
                       Option(title: "꿀", price: 8000)],
             price: Price(size: "L", price: 30000),
             total: 10000)
}
