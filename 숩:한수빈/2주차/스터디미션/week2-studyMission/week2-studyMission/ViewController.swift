//
//  ViewController.swift
//  week2-studyMission
//
//  Created by Subeen on 2023/09/30.
//

import UIKit

class ViewController: UIViewController {
    
    let diceImageNameData = ["one", "two", "three", "four", "five", "six"]
    
    lazy var doubleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴려주세요"
        return label
    }()
    
    lazy var playStackView: UIStackView = {
        let st = UIStackView()
//        st.backgroundColor = .yellow
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.spacing = 5
        
        return st
    }()
    
    
    lazy var diceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var secondDiceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
       let button = UIButton()
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
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

        
        playStackView.addArrangedSubview(diceImageView)
        playStackView.addArrangedSubview(secondDiceImageView)
        view.addSubview(playStackView)
        view.addSubview(changeButton)
        
        view.addSubview(doubleLabel)
    
    }
    
    private func setupAutoLayout() {
        doubleLabel.translatesAutoresizingMaskIntoConstraints = false
        playStackView.translatesAutoresizingMaskIntoConstraints = false
        diceImageView.translatesAutoresizingMaskIntoConstraints = false
        secondDiceImageView.translatesAutoresizingMaskIntoConstraints = false
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            playStackView.heightAnchor.constraint(equalToConstant: 300),
            
            doubleLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 30),
            doubleLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor),
            
            changeButton.widthAnchor.constraint(equalToConstant: 200),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            ])
    }
    
    @objc func didTapChangeDiceImageButton() {
        let firstDice = diceImageNameData.randomElement() ?? "one "
        let secondDice = diceImageNameData.randomElement() ?? "one "
        
        diceImageView.image = UIImage(named: firstDice)
        secondDiceImageView.image = UIImage(named: secondDice)
        
        if firstDice == secondDice {
            doubleLabel.text = "더블!"
        } else {
            doubleLabel.text = "다시 굴려주세요"
        }
    }
}
