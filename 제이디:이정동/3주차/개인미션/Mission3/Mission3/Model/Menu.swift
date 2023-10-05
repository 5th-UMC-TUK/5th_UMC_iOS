//
//  Menu.swift
//  Mission3
//
//  Created by 이정동 on 10/4/23.
//

import Foundation

struct Menu {
    static let name = "[재주문1위] 바싹불고기피자"
    
    static let size: [Option] = [
        .init(title: "M", price: 20000),
        .init(title: "L", price: 23000)
    ]
    
    static let dough: [Option] = [
        .init(title: "???", price: 1000),
        .init(title: "크림리치골드 크러스트", price: 4500)
    ]
    
    static let side: [Option] = [
        .init(title: "콜라", price: 2000),
        .init(title: "사이다", price: 2000)
    ]
}

struct Option {
    var title: String
    var price: Int
}

class Cart {
    static let shared = Cart()
    private init() {}
    
    var size: Option = Option(title: "", price: 0)
    var dough: Option?
    var side: [Option] = []
    var totalPrice = 0
    
    func reset() {
        self.size = Option(title: "", price: 0)
        self.dough = nil
        self.side.removeAll()
        self.totalPrice = 0
    }
}
