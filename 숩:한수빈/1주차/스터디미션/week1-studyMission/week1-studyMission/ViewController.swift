//
//  ViewController.swift
//  week1-studyMission
//
//  Created by Subeen on 2023/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    let diceImageNameData = ["one", "two", "three", "four", "five", "six"]
    
    lazy var diceImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "one"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(didTapChangeDiceImageButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupAutoLayout()
        
    }
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(diceImageView)
        view.addSubview(changeButton)
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            diceImageView.heightAnchor.constraint(equalToConstant: 300),
            diceImageView.widthAnchor.constraint(equalToConstant: 300),
            diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            changeButton.widthAnchor.constraint(equalToConstant: 200),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor, constant: 100)
            ])
    }
    
    @objc func didTapChangeDiceImageButton() {
        diceImageView.image = UIImage(named: diceImageNameData.randomElement() ?? "one ")
    }
}
