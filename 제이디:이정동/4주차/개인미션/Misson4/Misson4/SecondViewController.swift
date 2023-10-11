//
//  SecondViewController.swift
//  Misson4
//
//  Created by 이정동 on 10/5/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setTitle("돌아가기", for: .normal)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    @objc func backButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "@")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(ViewController())
    }
}
