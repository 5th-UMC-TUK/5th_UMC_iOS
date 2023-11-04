//
//  SecondViewController.swift
//  week4-mission
//
//  Created by Subeen on 2023/10/09.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private lazy var idLabel: UILabel = {
       let lb = UILabel()
        var email = UserDefaults.standard.string(forKey: "email")
        lb.text = "\(email ?? ".") 님 로그인"
        lb.textColor = .white
        return lb
    }()
    
    private lazy var logoutBtb: UIButton = {
       let bt = UIButton()
        bt.setTitle("로그아웃", for: .normal)
        bt.titleLabel?.textColor = .white
        bt.backgroundColor = .red
        bt.layer.cornerRadius = 10
        bt.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return bt
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        view.addSubview(idLabel)
        view.addSubview(logoutBtb)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutBtb.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            idLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoutBtb.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 200),
            logoutBtb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutBtb.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc func logoutButtonTapped() {
//        UserDefaults.standard.removeObject(forKey: "email")
//        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.removeObject(forKey: "autoLogin")
//        self.navigationController?.popViewController(animated: true)
        
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            scene.changeRootViewController(ViewController())
        }
    }
}
