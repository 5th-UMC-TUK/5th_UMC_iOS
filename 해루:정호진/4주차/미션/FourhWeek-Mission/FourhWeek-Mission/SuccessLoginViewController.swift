//
//  SuccessLoginViewController.swift
//  FourhWeek-Mission
//
//  Created by 정호진 on 10/12/23.
//

import Foundation
import UIKit
import SnapKit

final class SuccessLoginViewController: UIViewController {
    
    /// MARK:
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "로그인 성공!"
        label.font = .systemFont(ofSize: 40,weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
    }
}
