//
//  Menu.swift
//  week8_mission
//
//  Created by Subeen on 2023/11/21.
//

import Foundation

struct Menu: Hashable {
	var name: String
	var price: Int
	var selected: Bool
	
	var convertedPrice: String {
		String("+\(price)원")
	}
}
