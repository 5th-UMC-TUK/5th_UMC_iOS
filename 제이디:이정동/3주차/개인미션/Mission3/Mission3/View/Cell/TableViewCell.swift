//
//  SizeTableViewCell.swift
//  Mission3
//
//  Created by 이정동 on 10/4/23.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.isEnabled = false
        return button
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        contentView.addSubview(button)
        contentView.addSubview(title)
        contentView.addSubview(price)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        button.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview().inset(10)
            make.width.equalTo(button.snp.height)
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(button.snp.trailing).offset(10)
            make.centerY.equalTo(button.snp.centerY)
        }
        
        price.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(button.snp.centerY)
        }
    }
    
    func updateView(_ data: Option) {
        title.text = data.title
        price.text = "\(data.price)원"
    }
    
    func isSelectedToggle() {
        if self.isSelected {
            self.button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            self.button.tintColor = #colorLiteral(red: 0, green: 0.6622080207, blue: 0.3687388301, alpha: 1)
        } else {
            self.button.setImage(UIImage(systemName: "circle"), for: .normal)
            self.button.tintColor = .gray
        }
    }
}
