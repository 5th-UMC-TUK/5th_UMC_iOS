//
//  Introduction.swift
//  StudyMission
//
//  Created by 신예진 on 12/5/23.
//

import SwiftUI

struct PlayerCareerItem: Identifiable {
    let id = UUID()
    let team: String
    let league: String
    let season: String
}

struct Introduction: View {
    
    let playerCareerData: [[PlayerCareerItem]] = [
        [
            PlayerCareerItem(team: "Team A", league: "League 1", season: "2020-2021"),
            PlayerCareerItem(team: "Team B", league: "League 1", season: "2021-2022"),
        ],
        [
            PlayerCareerItem(team: "Team C", league: "League 2", season: "2022-2023"),
        ]
    ]
    
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                // 선수 소개
                HStack {
                    Image("Son")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Heung-Min Son")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Image("hotspur")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            
                            Text("Tottenham Hotspur")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // 선수 소개
                HStack {
                    Image("Kang")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100) // 이미지 크기 조절
                    
                    VStack(alignment: .leading) {
                        Text("Kang-In Lee")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Image("psg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20) // 이미지 크기 조절
                            
                            Text("Paris Saint-Germain")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal) // 좌우 여백 추가
                .padding(.top, 30)
                
                // 경력 정보
                ForEach(playerCareerData.indices, id: \.self) { sectionIndex in
                    Section(header: Text("Section \(sectionIndex + 1)")) {
                        ForEach(playerCareerData[sectionIndex]) { careerItem in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Team: \(careerItem.team)")
                                    Text("League: \(careerItem.league)")
                                    Text("Season: \(careerItem.season)")
                                }
                                .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                }
                
                // 경력 정보2
                ForEach(playerCareerData.indices, id: \.self) { sectionIndex in
                    Section(header: Text("Section \(sectionIndex + 1)")) {
                        ForEach(playerCareerData[sectionIndex]) { careerItem in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Team: \(careerItem.team)")
                                    Text("League: \(careerItem.league)")
                                    Text("Season: \(careerItem.season)")
                                }
                                .foregroundColor(.white)
                                Spacer()
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                }
                
                
             
                
                //선수 정보
                Section{
                    
                }
                
            }
        }
        
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Introduction()
        }
    }
}
