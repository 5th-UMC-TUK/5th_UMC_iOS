//
//  tapBarView.swift
//  week6_mission
//
//  Created by Subeen on 2023/11/08.
//

import SwiftUI

struct tapBarView: View {
    var body: some View {
        
        
        ZStack {
            Rectangle()
                .frame(height: 80)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .foregroundColor(.white)
                .shadow(radius: 2)
//                .overlay {
//                    HStack {
//                        VStack(spacing: 0) {
//                            Image("Search")
//                            Text("검색")
//                        }
//                        VStack(spacing: 0) {
//                            Image("Favorite")
//                            Text("검색")
//                        }
//                        VStack(spacing: 0) {
//                            Image("Home1")
//                                .padding(.bottom, 40)
//                        }
//                        VStack(spacing: 0) {
//                            Image("Order")
//                            Text("검색")
//                        }
//                        VStack(spacing: 0) {
//                            Image("My")
//                            Text("검색")
//                        }
//    //                    Image("Favorite")
//    //                    Image("Home1")
//    //                    Image("Order")
//    //                    Image("My")
//                    }
//                    .foregroundColor(.gray)
//                    .font(.caption)
//            }
            HStack(spacing: 45) {
                VStack(spacing: 0) {
                    Image("Search")
                    Text("검색")
                }
                VStack(spacing: 5) {
                    Image("Favorite")
                    Text("검색")
                }
                VStack(spacing: 5) {
                    Image("Home1")
                        .resizable()
//                        .sca()
                        .frame(width: 70, height: 70)
                        .padding(.bottom, 30)
                }
                VStack(spacing: 5) {
                    Image("Order")
                    Text("검색")
                }
                VStack(spacing: 5) {
                    Image("My")
                    Text("검색")
                }
//                    Image("Favorite")
//                    Image("Home1")
//                    Image("Order")
//                    Image("My")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .fontWeight(.bold)

        }

    }
}


struct tapBarView_Previews: PreviewProvider {
    static var previews: some View {
        tapBarView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
