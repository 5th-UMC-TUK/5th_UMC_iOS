//
//  Model.swift
//  ThirdWeek_StudyMission
//
//  Created by 정호진 on 10/5/23.
//

import Foundation
import UIKit


struct imageType {
    static let 가위 = UIImage(named: RockScissorPaper.가위.rawValue)
    static let 바위 = UIImage(named: RockScissorPaper.바위.rawValue)
    static let 보 = UIImage(named: RockScissorPaper.보.rawValue)
}

/// Index로 사용할 enum
enum type: Int {
    case 가위
    case 바위
    case 보
}

enum RockScissorPaper: String {
    case 가위
    case 바위
    case 보
}
