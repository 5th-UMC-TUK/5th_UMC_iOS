//
//  OneHouseDeliver.swift
//  SixWeek_Mission
//
//  Created by 정호진 on 11/7/23.
//

import SwiftUI

struct OneHouseDeliver: View {
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                    .frame(width: 20)
                
                Text("알뜰∙한집배달")
                    .font(.title3)
                    .bold()
                
                Text("배민1")
                    .font(.caption)
                    .bold()
                    .offset(CGSize(width: 9, height: 0))
                Text("은 365일 할인 중!")
                    .font(.caption)
                Spacer()
                Image(systemName: "greaterthan")
                Spacer()
                    .frame(width: 20)
            }
            
            VStack{
                HStack(spacing: 25){
                    Spacer()
                    OneElementButton(imageTitle: "saveDeliver",text: "알뜰배달")
                    OneElementButton(imageTitle: "pigfoot",text: "족발∙보쌈")
                    OneElementButton(imageTitle: "sushi",text: "돈까스∙회")
                    OneElementButton(imageTitle: "pizza",text: "피자")
                    OneElementButton(imageTitle: "china",text: "중식")
                    Spacer()
                }
                
                HStack(spacing: 25){
                    Spacer()
                    OneElementButton(imageTitle: "chicken",text: "치킨")
                    OneElementButton(imageTitle: "hamgurger",text: "버거")
                    OneElementButton(imageTitle: "ddak",text: "분식")
                    OneElementButton(imageTitle: "icecream",text: "디저트")
                    OneElementButton(imageTitle: "etc",text: "전체보기")
                    Spacer()
                }
                
            }.frame(height: 140)
            
        }
    }
}

#Preview {
    OneHouseDeliver()
}
