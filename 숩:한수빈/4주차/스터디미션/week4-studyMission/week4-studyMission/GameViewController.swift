//
//  GameViewController.swift
//  week4-studyMission
//
//  Created by Subeen on 2023/10/15.
//

import UIKit

class GameViewController: UIViewController {
    
    let gameImageNameData: [InputState] = [.scissors, .rock, .paper]

    
    enum InputState: String {
        case scissors
        case rock
        case paper
    }
    
    lazy var playStackView: UIStackView = {
        let st = UIStackView()
//        st.backgroundColor = .yellow
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.spacing = 5
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    
    lazy var computerGameImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var myGameImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var gameResultLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과는?"
        return label
    }()
    
    lazy var playerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Player?"
        return label
    }()
    
    lazy var computerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Computer?"
        return label
    }()
    
    lazy var inputStackView: UIStackView = {
        let st = UIStackView()
//        st.backgroundColor = .yellow
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.spacing = 5
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    lazy var scissorsButton: UIButton = {
       let button = UIButton()
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var rockButton: UIButton = {
       let button = UIButton()
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapChangeGameImageButton2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var paperButton: UIButton = {
       let button = UIButton()
        button.setTitle("보", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapChangeGameImageButton3), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(playStackView)
        playStackView.addArrangedSubview(computerGameImageView)
        playStackView.addArrangedSubview(myGameImageView)
        
        view.addSubview(gameResultLabel)
        
        view.addSubview(computerLabel)
        view.addSubview(playerLabel)
        
        view.addSubview(inputStackView)
        
        inputStackView.addArrangedSubview(scissorsButton)
        inputStackView.addArrangedSubview(rockButton)
        inputStackView.addArrangedSubview(paperButton)
        
        
        NSLayoutConstraint.activate([
            playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            playStackView.heightAnchor.constraint(equalToConstant: 300),
            
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            inputStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            inputStackView.heightAnchor.constraint(equalToConstant: 100),
            
            gameResultLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 20),
            gameResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            
            computerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 20),
//            computerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            computerLabel.centerXAnchor.constraint(equalTo: computerGameImageView.centerXAnchor),
          
            
            playerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 20),
//            playerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            playerLabel.centerXAnchor.constraint(equalTo: myGameImageView.centerXAnchor),
            
        ])
        
    }
   
    @objc func didTapChangeGameImageButton() {
        myGameImageView.image = UIImage(named: "scissors")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        
        gameResultLabel.text = fetchGameResult(.scissors, randomInput)
    }
    
    @objc func didTapChangeGameImageButton2() {
        myGameImageView.image = UIImage(named: "rock")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        
        gameResultLabel.text = fetchGameResult(.rock, randomInput)
    }
    
    @objc func didTapChangeGameImageButton3() {
        myGameImageView.image = UIImage(named: "paper")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        
        gameResultLabel.text = fetchGameResult(.paper, randomInput)
    }
    
    private func fetchGameResult(_ myInput: InputState, _ computerInput: InputState) -> String {
        switch myInput {
            
        case .scissors:
            switch computerInput {
            case .scissors:
                return "비김"
            case .rock:
                return "짐"
            case .paper:
                return "이김"
            }
            
        case .paper:
            switch computerInput {
            case .scissors:
                return "짐"
            case .rock:
                return "비김"
            case .paper:
                return "이김"
            }
            
        case .rock:
            switch computerInput {
            case .scissors:
                return "이김"
            case .rock:
                return "비김"
            case .paper:
                return "짐"
            }
        }
    }
}
