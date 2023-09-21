//
//  TableViewCell.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

class TableViewCell2: UITableViewCell {
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var navigationTitle: UILabel = {
        let label = UILabel()
        label.text = "시원한 여름 간식의 계절 🍉🍧🍦"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var navigationButton: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .black
        return iv
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        cv.isScrollEnabled = true
        cv.isUserInteractionEnabled = true
        return cv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        contentView.addSubview(navigationView)
        navigationView.addSubview(navigationTitle)
        navigationView.addSubview(navigationButton)
        contentView.addSubview(collectionView)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        
        navigationView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(30)
        }
        
        navigationTitle.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
        }
        
        navigationButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(navigationTitle.snp.height)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(5)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
}

extension TableViewCell2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CollectionViewData.list.count * 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.data = CollectionViewData.list[indexPath.row % 3]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: self.collectionView.frame.height)
    }
}
