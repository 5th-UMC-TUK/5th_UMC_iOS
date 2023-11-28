//
//  SearchBarView.swift
//  week6_mission
//
//  Created by Subeen on 2023/11/08.
//

import SwiftUI

struct SearchBarView: View {
    
    
    
    var body: some View {
        Rectangle()
        .frame(height: 70)
        .foregroundColor(Color.accentColor)
//        .cornerRadius(20)
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
        .overlay {
            ZStack {
                
                
                Rectangle()

//                    .clipShape(
//                        .rect(
//                            topLeadingRadius: 0,
//                            bottomLeadingRadius: 20,
//                            bottomTrailingRadius: 0,
//                            topTrailingRadius: 20
//                        )
//                    )
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .shadow(radius: 2)
                
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.accentColor)
                    Text("막국수? 꼬막무침? 갈비탕?")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.leading, 30)
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
