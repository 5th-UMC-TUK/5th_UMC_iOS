//
//  ViewController.swift
//  StudyMisson1
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

struct Dice {
    static let list = [
        UIImage(resource: .one),
        UIImage(resource: .two),
        UIImage(resource: .three),
        UIImage(resource: .four),
        UIImage(resource: .five),
        UIImage(resource: .six)
    ]
}

class ViewController: UIViewController {
    
    // MARK: - UI Property
    
    private lazy var diceImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Dice.list[(0...5).randomElement()!]
        return iv
    }()
    
    private lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경해주세요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews()
        configureConstraints()
        addTargets()
    }

    // MARK: - addSubviews()
    
    private func addSubviews() {
        view.addSubview(diceImageView)
        view.addSubview(randomButton)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        diceImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }
        
        randomButton.snp.makeConstraints { make in
            make.top.equalTo(diceImageView.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(70)
            make.height.equalTo(50)
        }
    }
    
    private func addTargets() {
        randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    @objc func randomButtonTapped() {
        diceImageView.image = Dice.list[(0...5).randomElement()!]
    }

}

