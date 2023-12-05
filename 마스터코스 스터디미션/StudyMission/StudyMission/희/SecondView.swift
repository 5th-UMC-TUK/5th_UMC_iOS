//
//  SecondView.swift
//  StudyMission
//
//  Created by 정호진 on 11/14/23.
//

import SwiftUI

struct Match {
    var team1: String
    var team2: String
    var score: String
    var player1: String
    var image1: String
    var name1: String
}

struct Player {
    var player1: String
}

struct ClubImage {
    var clubimage1: String
}

struct Name {
    var name1: String
}

enum TapInfo: String, CaseIterable {
    case player1 = "Heung-Min Son"
    case player2 = "Kang-In Lee"
}

struct SecondView: View {
    
    let matches = [
        Match(team1: "Team A", team2: "Team B", score: "2 - 1", player1: "Heung-Min Son", image1: "Son", name1: "Tottenham Hotspur"),
        Match(team1: "Team C", team2: "Team D", score: "0 - 0", player1: "Kang-In Lee", image1: "Kang", name1: "Paris Saint-Germain"),
        // Add more matches as needed
    ]
    
    let players = [
        Player(player1: "Heung-Min Son"),
        Player(player1: "Kang-In Lee"),
        // Add more players as needed
    ]
//    
//    let images = [
//        Image(image1: "Son"),
//        Image(image1: "Kang"),
//        // Add more images as needed
//    ]
    
    let clubImages = [
        ClubImage(clubimage1: "토트넘"),
        ClubImage(clubimage1: "psg"),
        // Add more club images as needed
    ]
    
    let clubNames = [
        Name(name1: "Tottenham Hotspur"),
        Name(name1: "Paris Saint-Germain"),
        // Add more club names as needed
    ]
    
    @State private var selectedPicker: TapInfo = .player1
    @Namespace private var animation

    var body: some View {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // 배경색을 검은색으로 설정
                
                ScrollView {
                    
                    Text("Favorite Players")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top,20)
                        .padding(.bottom,20)
                    
                    VStack {
                        TabTopTabView(selectedPicker: $selectedPicker, animation: animation)
                        
                        switch selectedPicker {
                        case .player1:
                            Introduction()
                        case .player2:
                            SecondIntroduction()
//                            // Your Players content
//                            ForEach(players, id: \.player1) { player in
//                                Text(player.player1)
//                                    .foregroundColor(.white) // 텍스트 색상을 흰색으로 설정
//                            }
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabTopTabView: View {
    
    @Binding var selectedPicker: TapInfo
    var animation: Namespace.ID
    
    var body: some View {
        HStack {
            ForEach(TapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .font(.title3)
                        .bold()
                        .foregroundColor(selectedPicker == item ? .white: .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.green) // 선택된 탭의 밑줄 색상을 green으로 설정
                            .frame(height: 3)
                            .font(.title3)
                            .bold()
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}
