//
//  TableViewCell.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import SnapKit

final class CartTableViewCell: UITableViewCell {
    static let identifier = "CartTableViewCell"
    
    /// MARK:
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK:
    private func addSubViews(){
        addSubview(stackView)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func inputData(menu: [Menu]){
        addSubViews()
        
        menu.forEach {
            let menuView = MenuUIView()
            stackView.addArrangedSubview(menuView)
            menuView.input(menu: $0)
        }
        
    }
    
}
