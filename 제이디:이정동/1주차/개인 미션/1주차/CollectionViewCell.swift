//
//  CollectionViewCell.swift
//  1주차
//
//  Created by 이정동 on 2023/09/19.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
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
        addSubview(label)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
        label.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(2)
        }
    }
    
    func setupUI(_ data: [Any]) {
        guard let image = data[0] as? UIImage,
              let text = data[1] as? String else { return }
        
        imageView.image = image
        label.text = text
    }
    
}
