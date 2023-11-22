//
//  Option.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/20/23.
//

import Foundation

struct Option: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let price: Int
}
