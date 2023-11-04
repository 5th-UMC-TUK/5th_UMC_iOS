//
//  ViewController.swift
//  Week04_StudyMission
//
//  Created by 이승진 on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tabBarButtonDidTap(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    

}

