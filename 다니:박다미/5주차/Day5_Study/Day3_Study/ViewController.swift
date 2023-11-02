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
enum GameResult: String{
    case win =  "이김"
    case draw = "비김"
    case lose = "짐"
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
        label.text = "나"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.text = "컴퓨터"
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
    
    lazy var scissorsButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("scissors", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var rockButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("rock", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var paperButton: GameButton = {
        let button = GameButton()
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
        
        scissorsButton.gameTag = .scissors
        paperButton.gameTag = .paper
        rockButton.gameTag = .rock
        
        
        myLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: -10).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: playStackView.leadingAnchor,constant: 20).isActive = true
        computerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: -10).isActive = true
        computerLabel.trailingAnchor.constraint(equalTo: playStackView.trailingAnchor, constant: -20).isActive = true
        
        scissorsButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        
    }
    @objc func didTapChangeGameImageButton(_ sender: UIButton) {
        guard let sender = sender as? GameButton else {return}
        switch sender.gameTag{
        case .scissors:
            myImageView.image = UIImage(named: "scissors")
        case .rock:
            myImageView.image = UIImage(named: "rock")
        case .paper:
            myImageView.image = UIImage(named: "paper")
            
        }
        let randomInput = ImageNameData.randomElement()!
        computerImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: sender.gameTag, computerInput: randomInput).rawValue
        
        
    }
    
    
    
    private func fetchGameResult(myInput: InputState, computerInput: InputState) -> GameResult{
        switch (myInput,computerInput) {
        case (.scissors, .scissors):
            return .draw
        case (.scissors, .rock):
            return .lose
        case (.scissors, .paper):
            return .win
       
        case (.paper, .scissors):
            return .lose
        case (.paper, .rock):
            return .win
        case (.paper, .paper):
            return .draw
        case (.rock, .scissors):
            return .win
        case (.rock, .rock):
            return .draw
        case (.rock, .paper):
            return .lose
        }
        
    }
}
class GameButton: UIButton {
    var gameTag: InputState = .rock
}
