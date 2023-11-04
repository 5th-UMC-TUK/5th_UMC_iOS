//
//  UserDefault.swift
//  FourhWeek-Mission
//
//  Created by 정호진 on 10/7/23.
//

import Foundation
import UIKit

/// 사용자 아이디 저장
final class UserDefault {
    static let shared = UserDefault()
    private init(){}
    
    /// MARK: 아이디 저장
    func save(info: String, type: String) -> Bool {
        switch type{
        case UserDefaultType.Id.rawValue:
            UserDefaults.standard.set(info, forKey: UserDefaultType.Id.rawValue)
            return true
        case UserDefaultType.Pw.rawValue:
            UserDefaults.standard.set(info, forKey: UserDefaultType.Pw.rawValue)
            return true
        default:
            fatalError()
        }
    }
    
    /// MARK: 아이디 불러옴
    func load(type: String) -> String {
        return UserDefaults.standard.string(forKey: type) ?? ""
    }
    
}


enum UserDefaultType: String{
    case Id
    case Pw
}
