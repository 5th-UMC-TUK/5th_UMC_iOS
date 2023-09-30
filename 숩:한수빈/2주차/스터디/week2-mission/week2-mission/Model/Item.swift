//
//  Items.swift
//  week2-mission
//
//  Created by Subeen on 2023/09/28.
//

import Foundation

struct Item {
    let image: ImageAsset
    let title: String
    let info: String
    let status: Status
    let price: String
    let chat: Int
    let heart: Int
}

struct Ad {
    let image: ImageAsset
    let title: String
    let price: String
}

enum Status: CustomStringConvertible {
    case ing        // 판매중 -> 표시X
    case done       // 거래완료 (진회색)
    case reserved   // 예약중  (초록)
    
    var description: String {
       switch self {
          case .ing:
             return "ing"
          case .done:
             return "done"
          case .reserved:
             return "reserved"
       }
    }
}



final class List {
    static let itemList : [Item] = [
        Item(image: .item1, title: "포켓몬 띠부띠부씰", info: "수원시 영통구 영통3동", status: .done, price: "1,000원", chat: 10, heart: 2),
        Item(image: .item2, title: "맛있는 유린기 팔아요", info: "수원시 영통구 영통3동", status: .done, price: "1,000원", chat: 1, heart: 3),
        Item(image: .item3, title: "장하오 굿즈 팔아요", info: "수원시 영통구 영통3동", status: .ing, price: "999,999원", chat: 99, heart: 99),
        Item(image: .item4, title: "카카오프렌즈 인형 여러 개 싸게 넘겨요", info: "수원시 영통구 영통3동", status: .reserved, price: "1,000원", chat: 0, heart: 10),
        Item(image: .item5, title: "맛있는 호박 팔아요", info: "수원시 영통구 영통3동", status: .ing, price: "10,000원", chat: 1, heart: 15),
    ]
    
    static let adList : [Ad] = [
        Ad(image: .item1, title: "스팸 2호 팔아요", price: "123,123원"),
        Ad(image: .item1, title: "스팸 2호 팔아요", price: "123,123원"),
        Ad(image: .item1, title: "스팸 2호 팔아요", price: "123,123원"),
        Ad(image: .item1, title: "스팸 2호 팔아요", price: "123,123원"),
        Ad(image: .item1, title: "스팸 2호 팔아요", price: "123,123원"),
    ]
}
