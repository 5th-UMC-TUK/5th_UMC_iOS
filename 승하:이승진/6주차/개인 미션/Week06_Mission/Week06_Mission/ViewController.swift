//
//  ViewController.swift
//  Week06_Mission
//
//  Created by 이승진 on 2023/11/08.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.play()
        animationView.loopMode = .loop
    }


}

