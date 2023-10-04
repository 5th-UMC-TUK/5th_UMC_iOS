//
//  PriceTableView.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxRelay

final class ToppingTableViewCell: UITableViewCell {
    static let identifier = "ToppingTableViewCell"
    
    /// MARK:
    private lazy var radioBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        return btn
    }()
    
    /// MARK:
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "b"
        return label
    }()
    
    /// MARK:
    private lazy var price: UILabel = {
        let label = UILabel()
        label.text = "a"
        return label
    }()
    
    override var isSelected: Bool  {
        didSet {
            if isSelected {
                radioBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }
            else{
                radioBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            }
        }
    }
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK:
    private func addSubViews(){
        addSubview(radioBtn)
        addSubview(label)
        addSubview(price)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        radioBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(radioBtn.snp.trailing).offset(20)
        }
        
        price.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func inputData(price: Price){
        self.price.text = "+\(price.price ?? 0)원"
        self.label.text = price.label
    }
}
