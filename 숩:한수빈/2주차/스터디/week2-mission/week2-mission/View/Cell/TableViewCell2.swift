//
//  TableViewCell2.swift
//  week2-mission
//
//  Created by Subeen on 2023/09/30.
//

// TODO: - 광고 뷰

import UIKit

class TableViewCell2: UITableViewCell {
    
    static let identfier = "TableViewCell2"

    // MARK: - 대표 이미지
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(.item1)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    // MARK: - 게시글 제목
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "스팸ㅇㄹㅁㅇㄴㄹㅁㄴㅇ"
        lb.numberOfLines = 0
        
        return lb
    }()
    
    // MARK: - 가격 라벨
    private lazy var priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "500원"
        lb.font = .systemFont(ofSize: 15, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    private lazy var stackView: UIStackView = {
       let st = UIStackView(arrangedSubviews: [imgView, titleLabel, priceLabel])
        st.axis = .vertical
        st.spacing = 5
        st.distribution = .equalSpacing
        
        st.alignment = .leading
        
        return st
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(_ ad: Ad) {
    }
    
    private func setUpUI() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0),
        
        ])
    }

}
