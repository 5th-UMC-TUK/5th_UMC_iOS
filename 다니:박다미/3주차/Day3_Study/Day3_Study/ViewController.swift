//
//  ViewController.swift
//  Day3_Study
//
//  Created by 박다미 on 2023/10/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    let ImageNameData = ["가위", "바위", "보"]
    let playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var myImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "가위"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var computerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "가위"))
        imageView.contentMode = .scaleAspectFit

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
  
    lazy var scissorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var rockButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var paperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("보", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(playStackView)
        playStackView.addArrangedSubview(myImageView)
        playStackView.addArrangedSubview(computerImageView)
        view.addSubview(inputStackView)
        inputStackView.addArrangedSubview(scissorsButton)
        inputStackView.addArrangedSubview(rockButton)
        inputStackView.addArrangedSubview(paperButton)
        
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        inputStackView.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 100).isActive = true
        
        inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        inputStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        scissorsButton.addTarget(self, action: #selector(scissorsButtonTapped), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(rockButtonTapped), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(paperButtonTapped), for: .touchUpInside)

    }

    @objc func scissorsButtonTapped(){
        myImageView.image = UIImage(named: "가위")
        guard let randomImage = ImageNameData.randomElement() else {return}
        computerImageView.image = UIImage(named:randomImage)
    }
    @objc func rockButtonTapped(){
        myImageView.image = UIImage(named: "바위")
        guard let randomImage = ImageNameData.randomElement() else {return}
        computerImageView.image = UIImage(named:randomImage)
    }
    @objc func paperButtonTapped(){
        myImageView.image = UIImage(named: "보")
        guard let randomImage = ImageNameData.randomElement() else {return}
        computerImageView.image = UIImage(named:randomImage)

        
    }


}
