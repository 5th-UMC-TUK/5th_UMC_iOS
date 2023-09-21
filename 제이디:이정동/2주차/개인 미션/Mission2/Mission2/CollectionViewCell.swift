//
//  CollectionViewCell.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var data: CVData? {
        didSet {
            configureUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(imageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(imageView.snp.horizontalEdges).inset(2)
            make.top.equalTo(imageView.snp.bottom).offset(3)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.horizontalEdges.equalTo(imageView.snp.horizontalEdges).inset(2)
        }
    }
    
    private func configureUI() {
        guard let data = data else { return }
        imageView.image = data.image
        titleLabel.text = data.title
        priceLabel.text = data.price
    }
}
