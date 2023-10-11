//
//  HorizontalCollectionViewCell.swift
//  Week04_Misson
//
//  Created by 이승진 on 2023/10/11.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookImageView.layer.cornerRadius = 8
        bookImageView.layer.masksToBounds = true
    }
}
