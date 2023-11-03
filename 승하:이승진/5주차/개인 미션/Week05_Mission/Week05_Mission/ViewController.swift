//
//  ViewController.swift
//  Week05_Mission
//
//  Created by 이승진 on 2023/11/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    
    var size = ""
    var price = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        essentialButton.layer.cornerRadius = 8
        essentialButton.layer.masksToBounds = true
        
        selectButton.layer.cornerRadius = 8
        selectButton.layer.masksToBounds = true
    }
    
    
    @IBAction func sizeCheckButtonTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            price = 20000
            size = "크기: M"
            sendButton.setTitle("\(price)원 담기", for: UIControl.State())
        }
    }
    
    
    @IBAction func sizeCheckLargeButtonTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            price = 23000
            size = "크기: L"
            sendButton.setTitle("\(price)원 담기", for: UIControl.State())
        }
    }
    
    
    @IBAction func sendData(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "cartVC") as? CartViewController else {
            return
        }
        
        vc.dataLabel = size
        vc.data = price
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

