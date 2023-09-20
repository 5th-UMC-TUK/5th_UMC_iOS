//
//  MiddleUIView.swift
//  FirstWeek_Mission
//
//  Created by 정호진 on 2023/09/19.
//

import Foundation
import UIKit
import SnapKit

final class MiddleUIView: UIView {
    
    /// MARK:
    private lazy var label1: UILabel = {
        let label = UILabel()
        label.text = "대용량특가"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    /// MARK:
    private lazy var label2: UILabel = {
        let label = UILabel()
        label.text = "많이 살수록 더 저렴하죠"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    /// MARK:
    private lazy var image1: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "greaterthan")?.withRenderingMode(.alwaysOriginal))
        return view
    }()
    
    /// MARK:
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let list: [String] = ["인기상품","신상품","특가","쌀,잡곡","화장지","생수,음료","즉석밥","통조림","헤어,바디","건강식품"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func input(){
        addUI()
    }
    
    /// MARK:
    private func addUI(){
        addSubview(label1)
        addSubview(label2)
        addSubview(image1)
        
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate  = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        label1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        label2.snp.makeConstraints { make in
            make.centerY.equalTo(label1.snp.centerY)
            make.leading.equalTo(label1.snp.trailing).offset(5)
        }
        
        image1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
}

extension MiddleUIView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        cell.input(text: list[indexPath.row], img: "bob")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/6, height: (collectionView.frame.height/2) - 10)
    }
    
}


final class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    /// MARK:
    private lazy var imgView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    /// MARK:
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    /// MARK:
    private func addUI(){
        addSubview(imgView)
        addSubview(label)

        constraints()
    }
    
    /// MARK:
    private func constraints(){
        imgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(label.snp.top)
        }
        
        label.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    
    func input(text: String?, img: String?){
        guard let text = text, let img = img else { return }
        imgView.image = UIImage(named: img)
        label.text = text
    }
}

