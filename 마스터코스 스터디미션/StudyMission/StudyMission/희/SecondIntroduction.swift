//
//  SecondIntroduction.swift
//  StudyMission
//
//  Created by 신예진 on 12/5/23.
//


import SwiftUI



struct SecondIntroduction: View {
    
    
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView{
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
                
                
            }

        }
        
    }
    
}



#Preview {
    SecondIntroduction()
}
