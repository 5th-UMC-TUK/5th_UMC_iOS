//
//  ViewController.swift
//  StudyMission3
//
//  Created by 이정동 on 10/5/23.
//

import UIKit
import SnapKit

enum RPS: CaseIterable {
    case rock
    case scissors
    case paper
    
    var image: UIImage {
        switch self {
        case .rock: return .rock
        case .scissors: return .scissors
        case .paper: return .paper
        }
    }
}

class ViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private lazy var myView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .paper)
        return view
    }()
    
    private lazy var comView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .paper)
        return view
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private lazy var rockView: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(resource: .rock), for: .normal)
        return view
    }()
    
    private lazy var scissorsView: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(resource: .scissors), for: .normal)
        return view
    }()
    
    private lazy var paperView: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(resource: .paper), for: .normal)
        return view
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
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        stackView.addArrangedSubview(myView)
        stackView.addArrangedSubview(comView)
        
        bottomStackView.addArrangedSubview(rockView)
        bottomStackView.addArrangedSubview(scissorsView)
        bottomStackView.addArrangedSubview(paperView)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(150)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(100)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
    }
    
    private func addTargets() {
        rockView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        scissorsView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        paperView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
        
    @objc func buttonTapped(_ sender: UIButton) {
        myView.image = sender.currentImage
        comView.image = RPS.allCases.randomElement()!.image
    }
}

