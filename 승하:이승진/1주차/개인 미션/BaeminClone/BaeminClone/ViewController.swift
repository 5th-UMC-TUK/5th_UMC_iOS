//
//  ViewController.swift
//  BaeminClone
//
//  Created by 이승진 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var couponImage: UIImageView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var adImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        makeButton()
    }
    
    func makeUI() {
        myView.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        myView.layer.borderWidth = 0.1
        myView.layer.cornerRadius = 20
        myView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        couponImage.layer.borderColor = UIColor.purple.cgColor
        couponImage.layer.cornerRadius = 10
        couponImage.layer.borderWidth = 1
        
        mainView.layer.borderColor = UIColor.white.cgColor
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 1
        
        adImageView.layer.borderColor = UIColor.systemBackground.cgColor
        adImageView.layer.cornerRadius = 10
        adImageView.layer.borderWidth = 1
        
        
    }
    
    func makeButton() {
        firstButton.layer.borderColor = UIColor.white.cgColor
        firstButton.layer.borderWidth = 12
        firstButton.layer.cornerRadius = 15
        
        secondButton.layer.borderColor = UIColor.white.cgColor
        secondButton.layer.borderWidth = 12
        secondButton.layer.cornerRadius = 15
        
        thirdButton.layer.borderColor = UIColor.white.cgColor
        thirdButton.layer.borderWidth = 12
        thirdButton.layer.cornerRadius = 15
    }
    

    
}

