//
//  Product.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/09/26.
//

import Foundation
import UIKit

struct Product {
    let image: UIImage?
    let title: String?
    let location: String?
    let time: String?
    let price: String?
    let chat: Int?
    let heart: Int?
}

struct Ads {
    let title: String?
    let list: [AdsProduct]?
}

struct AdsProduct {
    let image: UIImage?
    let title: String?
    let price: String?
}

/// MARK: List
final class List {
    static let productList: [Product] = [ 
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "1시간 전", price: "15,000원", chat: nil, heart: 10),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "4일 전", price: "15,000원", chat: 3, heart: nil),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "8시간 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: nil, price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "1일 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "3시간 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "1시간 전", price: "15,000원", chat: nil, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "4일 전", price: "15,000원", chat: 3, heart: nil),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "8시간 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: nil, price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "1일 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "3시간 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "1시간 전", price: "15,000원", chat: nil, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "4일 전", price: "15,000원", chat: 3, heart: nil),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "8시간 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: nil, price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "짜장면"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "1일 전", price: "15,000원", chat: 3, heart: 10),
        Product(image: UIImage(named: "삼겹살"), title: "삼겹살 팔아요~~", location: "인천광역시 연수구", time: "3시간 전", price: "15,000원", chat: 3, heart: 10),
    ]
    
    static let adsList: [Ads] = [
        Ads(title: "시즌 여름간식의 계절1 🍉 🍦", list: [
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "짜장면"), title: "짜장면~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
        ]),
        
        Ads(title: "시즌 여름간식의 계절2 🍉 🍦", list: [
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
        ]),
        
        Ads(title: "시즌 여름간식의 계절3 🍉 🍦", list: [
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
            AdsProduct(image: UIImage(named: "삼겹살"), title: "삼결살~", price: "15,000원"),
        ])
    ]
}
