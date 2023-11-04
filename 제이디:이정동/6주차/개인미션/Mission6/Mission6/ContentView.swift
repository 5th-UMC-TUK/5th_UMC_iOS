//
//  ContentView.swift
//  Mission6
//
//  Created by 이정동 on 11/2/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selectedIndex: Int = 2
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("찜")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "house.circle")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("주문내역")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "smiley")
                    Text("my배민")
                }
        }
        .tint(.black)
    }
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
}

#Preview {
    ContentView()
}
