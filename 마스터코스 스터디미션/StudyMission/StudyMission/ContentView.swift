//
//  ContentView.swift
//  StudyMission
//
//  Created by 정호진 on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "1.square")
                    Text("해루")
                }
            
            SecondView()
                .tabItem {
                    Image(systemName: "1.square")
                    Text("희")
                }
            
            ThirdView()
                .tabItem {
                    Image(systemName: "1.square")
                    Text("제옹")
                }
            
            FourthView()
                .tabItem {
                    Image(systemName: "1.square")
                    Text("다니")
                }
            
            FifthView()
                .tabItem {
                    Image(systemName: "1.square")
                    Text("숩")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
