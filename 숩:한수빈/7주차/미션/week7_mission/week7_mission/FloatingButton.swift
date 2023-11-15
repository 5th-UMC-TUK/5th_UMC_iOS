//
//  FloatingButton.swift
//  week7_mission
//
//  Created by Subeen on 2023/11/15.
//

import SwiftUI

struct FloatingButton: View {
	@State var isTapped = false
	
    var body: some View {
			VStack {
				
				Button {
					withAnimation {
						isTapped.toggle()
					}
				} label: {
					RoundedRectangle(cornerRadius: 999)
						.fill(isTapped ? .white : .orange)
						.frame(width: (isTapped ? 70 : 100), height: (isTapped ? 70 : 50))
						.shadow(radius: (isTapped ? 1 : 0))
						.overlay {
							if isTapped {
								Image(systemName: "plus")
									.foregroundColor(.black)
							}else {
								Text("+ 글쓰기")
									.foregroundColor(.white)
							}
						}
					
					
				}
				.animation(.linear(duration: 0.1))
			}
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
				.previewLayout(.sizeThatFits)
    }
}
