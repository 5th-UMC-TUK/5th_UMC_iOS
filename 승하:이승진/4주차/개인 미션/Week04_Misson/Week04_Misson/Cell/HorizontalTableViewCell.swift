//
//  HorizontalTableViewCell.swift
//  Week04_Misson
//
//  Created by 이승진 on 2023/10/11.
//

import UIKit

class HorizontalTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        let horizontalNib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        collectionView.register(horizontalNib, forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
