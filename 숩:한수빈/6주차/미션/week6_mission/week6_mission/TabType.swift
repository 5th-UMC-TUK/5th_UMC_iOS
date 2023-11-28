//
//  TabType.swift
//  week6_mission
//
//  Created by Subeen on 2023/11/08.
//

import Foundation

enum MainTabType: String, CaseIterable, CustomStringConvertible  {
    case home
    case board
    case recruit
    case profile
    
    var description: String {
        switch self {
        case .home:
            return "검색"
        case .board:
            return "찜"
        case .recruit:
            return "주문내역"
        case .profile:
            return "프로필"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .board:
            return "list.bullet.rectangle.fill"
        case .recruit:
            return "person.badge.plus"
        case .profile:
            return "person.crop.circl"
        }
    }
    
    
    var index: Int {
        switch self {
        case .home:
            return .zero
        case.board:
            return 1
        case .recruit:
            return 2
        case .profile:
            return 3
            
        }
    }
}
