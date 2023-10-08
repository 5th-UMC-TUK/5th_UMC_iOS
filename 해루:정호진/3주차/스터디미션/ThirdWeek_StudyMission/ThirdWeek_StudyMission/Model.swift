//
//  Model.swift
//  ThirdWeek_StudyMission
//
//  Created by 정호진 on 10/5/23.
//

import Foundation
import UIKit


struct imageType {
    static let 가위 = UIImage(named: "가위")
    static let 바위 = UIImage(named: "바위")
    static let 보 = UIImage(named: "보")
}

/// Index로 사용할 enum
enum type: Int {
    case 가위 = 0
    case 바위
    case 보
}
