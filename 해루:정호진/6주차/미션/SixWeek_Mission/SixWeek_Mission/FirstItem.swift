//
//  FirstItem.swift
//  SixWeek_Mission
//
//  Created by 정호진 on 11/6/23.
//
import SwiftUI

struct FirstItem: View {
    var body: some View {
        ZStack{
            Color.black
                .opacity(0.05)
            
            VStack{
                ZStack{
                    Color.cyan
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .top)
                    TopView()
                        .frame(alignment: .top)
                        .cornerRadius(20, corners: .bottomLeft)
                        .cornerRadius(20, corners: .bottomRight)
                }
                HStack{
                    Spacer()
                        .frame(width: 10)
                    ScrollView{
                        VStack{
                            HStack{
                                Button(action: {}, label: {
                                    Image("deliver")
                                        .frame(width: 120,height: 110)
                                })
                                .cornerRadius(20, corners: .allCorners)
                                
                                Button(action: {}, label: {
                                    Image("bmart")
                                        .frame(width: 120,height: 110)
                                })
                                .cornerRadius(20, corners: .allCorners)
                                
                                Button(action: {}, label: {
                                    Image("store")
                                        .frame(width: 120,height: 110)
                                })
                                .cornerRadius(20, corners: .allCorners)
                            }
                            
                            Spacer()
                                .frame(height: 15)
                            
                            ZStack{
                                Color.white
                                OneHouseDeliver()
                            }
                            .cornerRadius(20, corners: .allCorners)
                            .frame(height: 200)
                            
                            Image("ads") 
                                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                                .cornerRadius(20, corners: .allCorners)
                            
                            Spacer()
                                .frame(height: 15)
                            
                            ZStack{
                                Color.white
                                VStack{
                                    Spacer()
                                        .frame(height: 20)
                                    HStack(alignment: .center){
                                        OneElementButton(imageTitle: "bigSale",text: "대용량특가")
                                        OneElementButton(imageTitle: "bigSale",text: "대용량특가")
                                        OneElementButton(imageTitle: "bigSale",text: "대용량특가")
                                        OneElementButton(imageTitle: "bigSale",text: "대용량특가")
                                        Spacer()
                                            .frame(width: 100)
                                    }
                                    Spacer()
                                }
                            }
                            
                            
                            
                        }
                    }
                    Spacer()
                        .frame(width: 10)
                }
            }
        }
    }
}



#Preview {
    FirstItem()
}
