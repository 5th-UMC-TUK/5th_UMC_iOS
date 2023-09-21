//
//  NavigationTitleView.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

class NavigationTitleView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "정왕동"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
