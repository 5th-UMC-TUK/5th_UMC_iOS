//
//  DataList.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit

struct TBData {
    let image: UIImage
    let title: String
    let subTitle: String
    let state: State?
    let price: String
    let chatCnt: Int
    let heartCnt: Int
}

struct State {
    let text: String
    let color: UIColor
}

struct TableViewData {
    static let list = [
        TBData(image: UIImage(resource: .airpodmax2), title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", subTitle: "서울특별시 양천구 | 3시간 전", state: nil, price: "490,000원", chatCnt: 5, heartCnt: 10),
        TBData(image: UIImage(resource: .airpodmax3), title: "에어팟맥스 스페이스 그레이 풀박", subTitle: "서울특별시 양천구 | 1일 전", state: State(text: "판매완료", color: .lightGray), price: "550,000원", chatCnt: 1, heartCnt: 2),
        TBData(image: UIImage(resource: .airpodmax), title: "에어팟맥스실버", subTitle: "서울특별시 양천구 | 6일 전", state: State(text: "판매중", color: #colorLiteral(red: 0, green: 0.6208839417, blue: 0.4026042223, alpha: 1)), price: "370,000원", chatCnt: 15, heartCnt: 23),
    ]
}

struct CVData {
    let image: UIImage
    let title: String
    let price: String
}

struct CollectionViewData {
    static let list = [
        CVData(image: UIImage(resource: .cvdata1), title: "키친플라워 DW1201CP", price: "62,000원"),
        CVData(image: UIImage(resource: .cvdata2), title: "얼음 트레이 소 (얼음판)", price: "1,000원"),
        CVData(image: UIImage(resource: .cvdata3), title: "메가하이볼!!!", price: "6,000원"),
    ]
}
