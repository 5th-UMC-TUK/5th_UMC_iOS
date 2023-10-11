//
//  GameViewController.swift
//  week3-studyMission
//
//  Created by Subeen on 2023/10/09.
//

import UIKit

class GameViewController: UIViewController {
    
    let gameImageNameData = ["scissors", "rock", "paper"]

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
        view.backgroundColor = .green
        
        view.addSubview(playStackView)
        playStackView.addArrangedSubview(computerGameImageView)
        playStackView.addArrangedSubview(myGameImageView)
        
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
        ])
        
    }
   
    @objc func didTapChangeGameImageButton() {
        myGameImageView.image = UIImage(named: "scissors")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput)
    }
    
    @objc func didTapChangeGameImageButton2() {
        myGameImageView.image = UIImage(named: "rock")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput)
    }
    
    @objc func didTapChangeGameImageButton3() {
        myGameImageView.image = UIImage(named: "paper")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput)
    }
    
}
