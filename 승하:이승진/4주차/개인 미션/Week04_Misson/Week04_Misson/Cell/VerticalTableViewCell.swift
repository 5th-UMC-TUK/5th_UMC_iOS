//
//  VerticalTableViewCell.swift
//  Week04_Misson
//
//  Created by 이승진 on 2023/10/11.
//

import UIKit

class VerticalTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPlace: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 둥글게 만들기
        productImageView.layer.cornerRadius = 20
        productImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
