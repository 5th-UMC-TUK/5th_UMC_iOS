//
//  TitleUIView.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/10/01.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxRelay

final class TitleUIView: UIView {
    
    /// MARK:
    private lazy var imgView: UIImageView = {
        let view = UIImageView(image: DataList.image)
        
        return view
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK:
    private func addSubviews(){
        addSubview(imgView)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        imgView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}
