//
//  ContentView.swift
//  SixWeek_Mission
//
//  Created by 정호진 on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstItem()
                .tabItem {
                    Image("search")
                    Text("검색")
                }
            Text("The Second Tab")
                .tabItem {
                    Image("heart")
                    Text("찜")
                }
            Text("The Third Tab")
                .tabItem {
                    Image("mark")
                }
            Text("The Third Tab")
                .tabItem {
                    Image("recipt")
                    Text("주문내역")
                }
            Text("The Third Tab")
                .tabItem {
                    Image("smile")
                    Text("my배민")
                }
        }
    }
}

#Preview {
    ContentView()
}
