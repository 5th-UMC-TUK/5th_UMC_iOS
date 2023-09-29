//
//  CollectionViewCell.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/09/26.
//

import Foundation
import UIKit
import SnapKit


final class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    /// MARK: 이미지
    private lazy var image: UIImageView = {
        let view = UIImageView(image: UIImage(named: "삼겹살"))
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    /// MARK: 판매 제목
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    /// MARK: 가격 라벨
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
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
        addSubview(image)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(130)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.leading)
            make.trailing.equalTo(image.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.leading)
            make.trailing.equalTo(image.snp.trailing)
        }
        
    }
    
    func inputData(product: AdsProduct){
        
        
        image.image = product.image
        titleLabel.text = product.title ?? ""
        priceLabel.text = product.price ?? ""
    }
}
