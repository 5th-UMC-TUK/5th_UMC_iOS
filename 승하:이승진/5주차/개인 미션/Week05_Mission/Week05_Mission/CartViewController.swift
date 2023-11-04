//
//  CartViewController.swift
//  Week05_Mission
//
//  Created by 이승진 on 2023/11/01.
//

import UIKit

class CartViewController: UIViewController {
    
   
    @IBOutlet weak var sizeMLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var data = 0
    var dataLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.sizeMLabel.text = dataLabel
        self.priceLabel.text = "가격: \(data)원"
        self.totalPrice.text = "\(data)원"
    
    }
}
