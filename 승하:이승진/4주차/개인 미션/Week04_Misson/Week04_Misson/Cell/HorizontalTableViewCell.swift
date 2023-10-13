//
//  HorizontalTableViewCell.swift
//  Week04_Misson
//
//  Created by 이승진 on 2023/10/11.
//

import UIKit

// TableView 안에 CollectionView
class HorizontalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 함수로 CollectionView 설정하기
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        // "HorizontalCollectionViewCell 등록하기
        let horizontalNib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        collectionView.register(horizontalNib, forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
        
        // FlowLayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        // CollectionView에 FlowLayout 적용하기
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
