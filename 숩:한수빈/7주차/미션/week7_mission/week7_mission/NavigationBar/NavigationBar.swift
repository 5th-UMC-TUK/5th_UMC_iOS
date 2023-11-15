//
//  NavigationBar.swift
//  week7_mission
//
//  Created by Subeen on 2023/11/15.
//

import SwiftUI

struct NavigationBar: View {
	@State var isLeftBtnTapped = false
	
	
	var body: some View {
		VStack {
			HStack {
				Button {
	//				leftBtnAction()					// 전달 받은 액션을 버튼에 대
					withAnimation {
						isLeftBtnTapped.toggle()
					}
					
				} label: {
					HStack(spacing: 3) {
						Text("영통3동")
							.font(.system(.title3, weight: .bold))

						Image(systemName: isLeftBtnTapped ? "chevron.down" : "chevron.up")
//							.transition(.scale)
					}
					.foregroundColor(.black)
				}
				
				
				Spacer()
				
				HStack {
					Image(systemName: "line.3.horizontal")
					Image(systemName: "magnifyingglass")
					Image(systemName: "bell")
					
				}
			}
			.padding(.horizontal, 20)
			.frame(height: 50)
			.background(.white)
			
			if isLeftBtnTapped {
				
				HStack {
					Rectangle()
						.frame(width: 150, height: 150)
						.cornerRadius(10)
						.padding(.leading, 20)
						.foregroundColor(.white)
						.shadow(radius: 1)
						.overlay {
							VStack(alignment: .leading, spacing: 20) {
								Button {
									
								} label: {
									Text("영통3동")
										.foregroundColor(.black)
										.fontWeight(.bold)
								}
								
								Button {
									
								} label: {
									Text("정왕동")
										.foregroundColor(.gray)
								}
								Button {
									
								} label: {
									Text("내 동네 설정")
										.foregroundColor(.gray)
								}
							}
							.font(.system(.title3))

						}

					Spacer()
				}
			}
		}
	}
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
			NavigationBar()
				.previewLayout(.sizeThatFits)
    }
}
