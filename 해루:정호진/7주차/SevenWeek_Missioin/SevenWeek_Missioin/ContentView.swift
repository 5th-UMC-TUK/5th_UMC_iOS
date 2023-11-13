//
//  ContentView.swift
//  SevenWeek_Missioin
//
//  Created by 정호진 on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            HStack {
                Text("송도4동")
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                Image(systemName: "chevron.down")
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                Image(systemName: "bell")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            }
            ZStack(alignment: .bottomTrailing){
                TabView{
                    ListView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("홈")
                        }
                    Text("The Second Tab")
                        .tabItem {
                            Image(systemName: "newspaper")
                            Text("동네생활")
                        }
                    Text("The Third Tab")
                        .tabItem {
                            Image(systemName: "carrot")
                            Text("내근처")
                        }
                    Text("The Fourth Tab")
                        .tabItem {
                            Image(systemName: "message")
                            Text("채팅")
                        }
                    Text("The Fifth Tab")
                        .tabItem {
                            Image(systemName: "person")
                            Text("나의 당근")
                        }
                }
                
                HStack{
                    Button(action: {}, label: {
                        Text("+ 글쓰기")
                            .foregroundStyle(Color.white)
                    })
                    
                }
                .frame(width: 100,height: 50,alignment: .center)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 70, trailing: 10))
                
                
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
