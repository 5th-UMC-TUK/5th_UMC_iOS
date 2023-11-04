//
//  HomeView.swift
//  Mission6
//
//  Created by 이정동 on 11/2/23.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color(hex: "f6f6f6")
                    .ignoresSafeArea(edges: .bottom)
                
                VStack {
                    SearchBar(text: $text)
                        .background(Color(hex: "5ebebb"))
                        .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0))
                    
                    Image("banner1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    HStack {
                        Image("button1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("button2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("button3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    VStack {
                        Image("banner2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding()
                        
                        HStack {
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        HStack {
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack {
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("인기상품")
                                    .foregroundStyle(.black)
                                    .font(.caption)
                            }
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    }
                    .background(.white)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    
                    Image("banner3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("우리집")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "rectangle.grid.2x2")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "bell")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "cart")
                }
            }
            .background(Color(hex: "5ebebb"))
            .foregroundStyle(.white)
            .fontWeight(.semibold)
        }
        
        
        
    }
}

#Preview {
    HomeView()
}


