//
//  ItemListManager.swift
//  week3-mission
//
//  Created by Subeen on 2023/10/03.
//

import Foundation

final class ItemListManager {
    private var itemList: [Item] = []
    
    // 아이템 리스트 얻기
    func getItemsList() -> [Item] {
        return itemList
    }
    
    // 새로운 아이템 만들기
    func makeNewItem(_ item: Item) {
        itemList.append(item)
    }
    
    // 아이템 삭제
    func deleteItem(index: Int) {
        itemList.remove(at: index)
    }
    
    // 특정 멤버 얻기
    subscript(index: Int) -> Item {
        get {
            return itemList[index]
        }
        
        set {
            itemList[index] = newValue
        }
    }
}
