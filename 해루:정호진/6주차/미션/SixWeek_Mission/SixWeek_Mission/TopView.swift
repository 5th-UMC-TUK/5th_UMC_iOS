//
//  TopView.swift
//  SixWeek_Mission
//
//  Created by 정호진 on 11/6/23.
//

import Foundation
import SwiftUI

struct TopView: View {
    @State private var seachWord = "검색"
    var body: some View {
        ZStack{
            Color.cyan
            VStack{
                Spacer()
                HStack{
                    Text("우리집")
                        .offset(CGSize(width: 15, height: 0))
                    
                    Spacer()
                    
                    Button(action: {
                        print("clicked 1")
                    }, label: {
                        Image(systemName: "square.grid.2x2")
                    })
                    .offset(CGSize(width: -10, height: 0))
                    
                    Button(action: {
                        print("clicked 2")
                    }, label: {
                        Image(systemName: "bell")
                    })
                    .offset(CGSize(width: -10, height: 0))
                    
                    Button(action: {
                        print("clicked 3")
                    }, label: {
                        Image(systemName: "cart")
                    })
                    .offset(CGSize(width: -15, height: 0))
                    
                }
                SearchBar(text: $seachWord)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            
        }
        .frame(height: 100,
               alignment: .top)
    }
}

#Preview {
    TopView()
}




struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField("Search", text: $text)
                    .foregroundColor(.primary)

                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
        }
        .padding(.horizontal)
    }
}
