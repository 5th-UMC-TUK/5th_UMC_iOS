//
//  Item.swift
//  week3-mission
//
//  Created by Subeen on 2023/09/30.
//

import UIKit

protocol ItemDelegate: AnyObject {
    func addNewItem(_ item: Item)
    func delete(index: Int, _ item: Item)
}

struct Item {
    var name: String
    var price: Int
}

