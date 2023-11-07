//
//  OneElementButton.swift
//  SixWeek_Mission
//
//  Created by 정호진 on 11/7/23.
//

import Foundation
import SwiftUI

struct OneElementButton: View {
    @State var imageTitle: String = ""
    @State var text: String = ""
    
    var body: some View {
        VStack{
            ZStack{
                Color.black
                    .opacity(0.05)
                Button(action: {}, label: {
                    Image(imageTitle)
                })
            }
            .cornerRadius(20, corners: .allCorners)
            Text(text)
                .font(.caption)
                .fixedSize()
                
        }
    }
}
