//
//  ShopView.swift
//  week8_mission
//
//  Created by Subeen on 2023/11/21.
//

import SwiftUI

struct ShopView: View {
	@StateObject private var menuListViewModel = MenuListViewModel()
	
    var body: some View {
			VStack {
				TopTitleView()
				ShoppingView()
					.environmentObject(menuListViewModel)
				Spacer()
			}//: VSTACK
    }
}

// MARK: - 타이틀 뷰
private struct TopTitleView: View {
	
	fileprivate var body: some View {
		VStack {
			HStack {
				Rectangle()
					.frame(width: 20, height: 20)
				Text("롯데리아 수원망포점")
					.font(.system(size: 20, weight: .bold))
				Spacer()
				Text("40~50분 후 도착")
			}//: HSTACK
			.padding(.horizontal, 20)
			.padding(.vertical, 15)
			
			Rectangle()
				.fill(.gray)
				.frame(height: 1)
			
		}//: ZSTACK
	}
}

// MARK: - 빈 장바구니 뷰
private struct EmptyShopView: View {
	
	fileprivate var body: some View {
		VStack {
			
		}
	}
}

// MARK: - 장바구니 뷰
private struct ShoppingView: View {
	@EnvironmentObject private var menuListViewModel: MenuListViewModel
	
	fileprivate var body: some View {
		VStack {
			Text(menuListViewModel.name)
			HStack {
				Rectangle()
					.fill(.black)
					.frame(width: 100, height: 100)
				
				VStack {
					Text(menuListViewModel.showMenuList())
					
				}
				Spacer()
			}
			.padding(.horizontal, 20)
		}
	}
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
				.environmentObject(MenuListViewModel())
    }
}
