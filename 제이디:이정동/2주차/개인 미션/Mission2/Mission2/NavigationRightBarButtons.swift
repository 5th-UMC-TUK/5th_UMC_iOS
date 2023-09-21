//
//  NavigationRightBarButtons.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

class NavigationRightBarButtons: UIView {
    
    private lazy var firstBarButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "list.bullet")
        view.tintColor = .black
        return view
    }()
    
    private lazy var secondBarButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "magnifyingglass")
        view.tintColor = .black
        return view
    }()
    
    private lazy var thirdBarButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bell")
        view.tintColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(firstBarButton)
        addSubview(secondBarButton)
        addSubview(thirdBarButton)
        
        thirdBarButton.snp.makeConstraints { make in
            make.verticalEdges.trailing.equalToSuperview()
            make.width.equalTo(thirdBarButton.snp.height)
        }
        
        secondBarButton.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalTo(thirdBarButton.snp.leading).offset(-15)
            make.width.equalTo(secondBarButton.snp.height)
        }
        
        firstBarButton.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalTo(secondBarButton.snp.leading).offset(-15)
            make.width.equalTo(firstBarButton.snp.height)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
