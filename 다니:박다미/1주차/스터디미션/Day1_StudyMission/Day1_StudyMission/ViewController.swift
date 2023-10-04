//
//  ViewController.swift
//  Day1_StudyMission
//
//  Created by 박다미 on 2023/09/23.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    let diceImageNameData = ["1","2","3","4","5","6"]
    let playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var diceImageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var diceImageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFit

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var doubleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴려주세요!"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var changeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(playStackView)
        playStackView.addArrangedSubview(diceImageView1)
        playStackView.addArrangedSubview(diceImageView2)

        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(doubleLabel)
        
        doubleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doubleLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(changeButton)
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: playStackView.bottomAnchor,constant: 100).isActive = true
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func didTapChangeDiceImageButton(){
        diceImageView1.image = UIImage(named: diceImageNameData.randomElement() ?? "1" )
        diceImageView2.image = UIImage(named: diceImageNameData.randomElement() ?? "1" )
        if diceImageView1.image == diceImageView2.image {
            doubleLabel.text = "더블!!"
        }
        else {
            doubleLabel.text = "주사위를 다시 굴려주세요"
        }
    }
    
    
}

