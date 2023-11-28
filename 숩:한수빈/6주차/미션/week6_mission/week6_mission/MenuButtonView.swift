//
//  MenuButtonView.swift
//  week6_mission
//
//  Created by Subeen on 2023/11/07.
//

import SwiftUI

struct MenuButtonView: View {
    var name: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.background)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(name)
                        .resizable()
                        .cornerRadius(20)
                }
            Text(name)
                .foregroundColor(.black)
        }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(name: "족발보쌈")
            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.)
    }
}
