//
//  Model.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import Foundation
import UIKit

struct DataList {
    static let title: String = "돼지같은 돼지집"
    
    static let image: UIImage = UIImage(named: "삼겹살") ?? UIImage()
    
    static let priceList: [Price] = [
        Price(price: 100000000, label: "0인분"),
        Price(price: 13000, label: "1인분"),
        Price(price: 25000, label: "2인분"),
        Price(price: 37000, label: "3인분"),
        Price(price: 50000, label: "4인분"),
    ]
    
    static let toppingList: [Price] = [
        Price(price: 11000, label: "목살 1인분"),
        Price(price: 1500, label: "김치"),
        Price(price: 1000, label: "마늘"),
        Price(price: 3000, label: "쌈"),
    ]
    
    static var selectionMenuList: [Menu] = []
}




struct Price {
    let price: Int?
    let label: String?
}

struct Menu {
    let price: Price?
    let topping: [Price]?
}
