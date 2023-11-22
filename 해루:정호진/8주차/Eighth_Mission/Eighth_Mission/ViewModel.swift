//
//  ViewModel.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/20/23.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var priceList =  [Price(size: "L", price: 30000),
                                 Price(size: "M",price: 20000),
                                 Price(size: "S",price: 10000)]
    
    @Published var optionList =  [Option(title: "케찹", price: 5000),
                                  Option(title: "크림", price: 1400),
                                  Option(title: "꿀", price: 8000),
                                  Option(title: "칠리", price: 3000),
                                  Option(title: "마요네즈", price: 2000)]
    
    @Published var itemSize: Price? {
        didSet {
            objectWillChange.send()
        }
    }
    
    @Published var checkOptions = Set<Option>()
    
    @Published var totalMoney: Int = 0 {
        didSet {
            objectWillChange.send()
        }
    }
    
    func calculate() {
        let sizePrice = priceList.filter{$0 == itemSize}.first?.price ?? 0
        var optionPrice = 0
        _ = checkOptions.map{ optionPrice += $0.price }
        totalMoney = sizePrice + optionPrice
    }
    
}
