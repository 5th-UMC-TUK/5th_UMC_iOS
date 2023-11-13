//
//  AdsView.swift
//  SevenWeek_Missioin
//
//  Created by 정호진 on 11/13/23.
//

import SwiftUI

struct AdsView: View {
    @State var image: String
    @State var adsTitle: String
    @State var price: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 120,height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text(adsTitle)
                .frame(width: 120)
                .lineLimit(2)
            Text(price)
                .fontWeight(.bold)
        }
        
    }
}

#Preview {
    AdsView(image: "짜장면",adsTitle: "asdasdasdasdasdasd",price: "10000")
}
