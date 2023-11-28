//
//  MenuListViewModel.swift
//  week8_mission
//
//  Created by Subeen on 2023/11/21.
//

import Foundation

class MenuListViewModel: ObservableObject {
	@Published var name: String
	@Published var price: Int
	@Published var title: String
	@Published var menus: [Menu]
	@Published var count: Int
	
	var countString: String {
		"\(count)개"
	}
	
	
	@Published var totalPrice: Int


	init(
		name: String = "맥스파이시 상하기버거 세트",
		price: Int = 8200,
		title: String = "사이드 선택",
		menus: [Menu] = [.init(name: "코카 콜라 라지", price: 0, selected: true),
												 .init(name: "환타 라지", price: 0, selected: false),
												 .init(name: "바닐라 쉐이크 미디엄", price: 600, selected: false),
												 .init(name: "딸기 쉐이크 미디엄", price: 600, selected: false),
												 .init(name: "카푸치노 라지", price: 1600, selected: false),
												 .init(name: "바닐라 라떼 라지", price: 2100, selected: false),
												 .init(name: "제주 한라봉 칠러 라지", price: 1800, selected: false)
											],
		count: Int = 1
	) {
		self.name = name
		self.price = price
		self.title = title
		self.menus = menus
		self.count = count
		self.totalPrice = price
	}
}

extension MenuListViewModel {
	
	// 셀 터치시, Menu의 selected 값 toggle
	func selectedBoxTapped(_ menu: Menu) {
		if let index = menus.firstIndex(where: { $0 == menu }) {
			menus[index].selected.toggle()
		}
	}
	
	func calcTotalPrice(_ menus: [Menu]) {
		var total = price

		for index in menus.indices {
			if menus[index].selected {
				total += menus[index].price
			}
		}
		
		self.totalPrice = total * self.count
	}
	
	func showMenuList() -> String{
		var list = "- \(title) : "
		for i in menus.indices {
			if menus[i].selected {
				list.append("\(menus[i].name)")
				
				if menus[i].price != 0 {
					list.append( "(\(menus[i].price))")
				}
				
				list.append("/")
			}
		}
		
		return list
	}
//	func addBtnTapped() {
//		count += 1
//	}
//
//	func minusBtnTapped() {
//		count -= 1
//	}
}
