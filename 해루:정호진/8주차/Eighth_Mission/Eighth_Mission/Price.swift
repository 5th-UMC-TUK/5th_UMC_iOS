//
//  Model.swift
//  Eighth_Mission
//
//  Created by 정호진 on 11/20/23.
//

import Foundation

struct Price: Identifiable, Hashable {
    var id = UUID()
    var size: String
    var price: Int
}
