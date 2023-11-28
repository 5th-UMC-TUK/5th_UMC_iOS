//
//  ButtonView.swift
//  week6_mission
//
//  Created by Subeen on 2023/11/07.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var subtitle: String
//    var image: UIImage
    
    var body: some View {
        Button {
            
        } label: {
            Rectangle()
                .fill(.white)
                
                .shadow(radius: 1.0)
                .frame(width: 120, height: 120)
                .overlay {
                    ZStack {
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Image(title)
                                    .frame(width: 50, height: 50)
                            }
                        }
                   
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text(title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    
                                    
                                    .padding(.top, 15)
                                    
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(subtitle)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 5)
                                
                                Spacer()
                                
                            }
                            
                            
                            Spacer()
                        }
                        .foregroundColor(.black)
                    .padding(.leading, 15)
                        
                        
                    }
                }
                .cornerRadius(10)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "배달", subtitle: "요즘 배민 맛집은?")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
