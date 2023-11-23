//
//  HomeViewController.swift
//  Week08_Mission
//
//  Created by 이승진 on 2023/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "두둥!!!"
        label.font = UIFont.systemFont(ofSize: 60)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        
    }
    
    func makeUI() {
        view.backgroundColor = .black
        
        view.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
