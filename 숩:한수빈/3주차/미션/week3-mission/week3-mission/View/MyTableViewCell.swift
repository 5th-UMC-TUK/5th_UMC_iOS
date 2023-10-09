//
//  MyTableViewCell.swift
//  week3-mission
//
//  Created by Subeen on 2023/10/03.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    // MARK: - Item 구현
    var item: Item?

    let menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "item")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let priceLabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let deleteButton: UIButton = {
        let bt = UIButton()
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        contentView.addSubview(menuImageView)
        
        NSLayoutConstraint.activate([
//            menuImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            menuImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            menuImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
}
