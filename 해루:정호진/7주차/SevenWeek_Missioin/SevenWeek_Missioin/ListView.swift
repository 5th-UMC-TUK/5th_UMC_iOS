//
//  ContentView.swift
//  SevenWeek_Missioin
//
//  Created by 정호진 on 11/13/23.
//

import SwiftUI

struct ListView: View {
    let list = [Product(productTitle: "짜장면", location: "송도", price: "10,000원", heart: 100, chat: 24, reservation: true),
                Product(productTitle: "짜장면", location: "서울역", price: "8,000원", heart: 30, chat: 4, reservation: false),
                Product(productTitle: "짜장면", location: "강남역", price: "20,000원", heart: 1, chat: 2, reservation: false),
                Product(productTitle: "짜장면", location: "정왕", price: "7,000원", heart: 1, chat: 0, reservation: false),
                Product(productTitle: "짜장면", location: "문래", price: "12,000원", heart: 0, chat: 4, reservation: true),
                Product(productTitle: "짜장면", location: "시청", price: "9,000원", heart: 0, chat: 0, reservation: false),
                Product(productTitle: "짜장면", location: "용산", price: "11,000원", heart: 5, chat: 2, reservation: true)]
    let adsList = [Ads(image: "군고구마",title: "달달구리 곡구마", price: "10,000원"),
                   Ads(image: "떡꼬치", title: "쫄깃한 떡꼬치", price: "9,000원"),
                   Ads(image: "귤", title: "ㄱㄱㄱㄱ귤", price: "2,000원"),
                   Ads(image: "붕어빵", title: "붕어 같은 잉어", price: "4,000원")]
    
    var body: some View {
        
        ScrollView() {
            VStack{
                ForEach(list, id: \.self) {
                    ProductView(productTitle: $0.productTitle, location: $0.location, price: $0.price, heart: $0.heart, chat: $0.chat, reservation: $0.reservation)
                }
                
                
                HStack{
                    Text("시원한 겨울 간식의 계절🍺🍺🍺")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(adsList, id: \.self) {
                            AdsView(image: $0.image,
                                    adsTitle: $0.title,
                                    price: $0.price)
                        }
                    }
                }
            }
        }

    }
}

#Preview {
    ListView()
}
