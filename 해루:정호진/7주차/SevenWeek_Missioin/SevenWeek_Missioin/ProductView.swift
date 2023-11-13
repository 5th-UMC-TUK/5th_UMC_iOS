//
//  ProductView.swift
//  SevenWeek_Missioin
//
//  Created by 정호진 on 11/13/23.
//

import SwiftUI

struct ProductView: View {
    var id = UUID()
    @State var productTitle: String
    @State var location: String
    @State var price: String
    @State var heart: Int
    @State var chat: Int
    @State var reservation: Bool
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            HStack(alignment: .top) {
                Image("짜장면")
                    .resizable()
                    .frame(width: 120,height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                VStack(alignment: .leading) {
                    Text(productTitle)
                        .frame(alignment: .leading)
                        .lineLimit(2)
                        .font(Font.system(size: 20))
                        
                    Text(location)
                        .foregroundStyle(.gray)
                        
                    HStack{
                        if reservation {
                            Text("예약중")
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .foregroundStyle(Color.white)
                                .font(.callout)
                        }
                        Text(price)
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                
            }
            
            HStack {
                if heart != 0 {
                    Image(systemName: "heart")
                        .font(.callout)
                    
                    Text("\(heart)")
                        .font(.callout)
                }
                if chat != 0 {
                    Image(systemName: "message")
                        .font(.callout)
                    Text("\(chat)")
                        .font(.callout)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
        
    }
}

#Preview {
    ProductView(productTitle: "Hello",
                location: "here",
                price: "10000",
                heart: 10,
                chat: 20,
                reservation: false)
}
