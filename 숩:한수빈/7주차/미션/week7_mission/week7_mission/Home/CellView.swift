//
//  CellView.swift
//  week7_mission
//
//  Created by Subeen on 2023/11/15.
//

import SwiftUI

struct CellView: View {
    var body: some View {
			VStack(spacing: 0) {
				HStack(spacing: 15) {
					Image("item1")
						.padding(.leading, 15)
					
					VStack(alignment: .leading, spacing: 0) {
						Text("닌텐도 구형")
							.font(.body)
						Text("subtitle")
							.font(.caption)
							.foregroundColor(.gray)
						HStack(spacing: 0) {
							Image("stateFileName")
								.padding(5)
							Text("price")
								.font(.body)
								.fontWeight(.bold)
						}
						Spacer()
					}
					.padding(.vertical, 10)
					
					Spacer()
					
					
					VStack(alignment: .trailing, spacing: 0) {
						Image(systemName: "ellipsis")
							.rotationEffect(.degrees(90))
							.padding(.top, 20)
						
						Spacer()
						
						HStack(spacing: 3) {
							Image(systemName: "message")
							Text("3")
							Image(systemName: "heart")
							Text("3")
						}
					}
					.padding(.trailing, 10)
					.foregroundColor(.gray)
				}
				.frame(height: 120)
				.padding(.vertical, 10)
				
				Rectangle()
					.fill(.gray)
					.opacity(0.3)
					.frame(height: 1)
					.padding(.horizontal, 10)
			}
		}
			
			
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
				.previewLayout(.sizeThatFits)
    }
}
