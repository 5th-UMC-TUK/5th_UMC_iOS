//
//  ViewController.swift
//  Day3_Study
//
//  Created by 박다미 on 2023/10/08.
//

import UIKit
import SnapKit

enum InputState: String{
    case scissors
    case rock
    case paper
}

class ViewController: UIViewController {

    
    let ImageNameData : [InputState] =  [.scissors,.rock,.paper]
    let playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var myImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "scissors"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var computerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "scissors"))
        imageView.contentMode = .scaleAspectFit

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = "가위"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.text = "가위"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
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
        button.setTitle("scissors", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var rockButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("rock", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var paperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("paper", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var gameResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "결과"
        return label
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
        view.addSubview(gameResultLabel)
        view.addSubview(myLabel)
        view.addSubview(computerLabel)
        
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        gameResultLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 20).isActive = true
        gameResultLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        inputStackView.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 100).isActive = true
        
        inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        inputStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        myLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: -10).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: playStackView.leadingAnchor,constant: 20).isActive = true
        computerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: -10).isActive = true
        computerLabel.trailingAnchor.constraint(equalTo: playStackView.trailingAnchor, constant: -20).isActive = true
        
        scissorsButton.addTarget(self, action: #selector(scissorsButtonTapped), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(rockButtonTapped), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(paperButtonTapped), for: .touchUpInside)

    }

    @objc func scissorsButtonTapped(){
        myImageView.image = UIImage(named: "scissors")
        guard let randomImage = ImageNameData.randomElement() else {return}
        computerImageView.image = UIImage(named:randomImage.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .scissors, computerInput: randomImage)
    }
    @objc func rockButtonTapped(){
        myImageView.image = UIImage(named: "rock")
        guard let randomImage = ImageNameData.randomElement() else {return}
        computerImageView.image = UIImage(named:randomImage.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .rock, computerInput: randomImage)

    }
    @objc func paperButtonTapped(){
        myImageView.image = UIImage(named: "paper")
        guard let randomImage = ImageNameData.randomElement() else {return}
        computerImageView.image = UIImage(named:randomImage.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .paper, computerInput: randomImage)


        
    }

    private func fetchGameResult(myInput: InputState, computerInput: InputState) -> String{
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
        case .rock:
            switch computerInput {
            case .scissors:
                return "이김"
            case .rock:
                return "비김"
            case .paper:
                return "짐"
            }
        case .paper:
            switch computerInput {
            case .scissors:
                return "짐"
            case .rock:
                return "이김"
            case .paper:
                return "비김"
            }
        }

    }
}
