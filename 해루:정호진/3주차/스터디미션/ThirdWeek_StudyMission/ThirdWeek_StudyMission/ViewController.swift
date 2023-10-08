//
//  ViewController.swift
//  ThirdWeek_StudyMission
//
//  Created by 정호진 on 10/5/23.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - UI Property
    
    /// MARK: 로봇이 내는 이미지
    private lazy var robotImage: UIImageView = {
        let view = UIImageView(image: imageType.가위)
        return view
    }()
    
    /// MARK: 내가 누르는 이미지
    private lazy var myImage: UIImageView = {
        let view = UIImageView(image: imageType.가위)
        return view
    }()
    
    /// MARK: 이미지들 담을 StackView
    private lazy var 이미지stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [robotImage, myImage] )
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    /// MARK: 결과 라벨
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "시작!"
        return label
    }()
    
    /// MARK: 가위 버튼
    private lazy var 가위: UIButton = {
        let btn = UIButton()
        btn.setTitle("✌️", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemRed
        btn.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    /// MARK: 바위 버튼
    private lazy var 바위: UIButton = {
        let btn = UIButton()
        btn.setTitle("✊", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        btn.backgroundColor = .systemBrown
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    /// MARK: 보 버튼
    private lazy var 보: UIButton = {
        let btn = UIButton()
        btn.setTitle("✋", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemCyan
        btn.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    /// MARK: 가위 바위 보 담을 StackView
    private lazy var 가위바위보stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [가위,바위,보] )
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    
    /// 선택한 이미지 인덱스
    private var selectedImageIndex: Int?
    
    /// 로봇 이미지 인덱스
    private var robotImageIndex: Int?
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
    }

    /// MARK: Add UI
    private func addSubViews(){
        view.addSubview(이미지stackView)
        view.addSubview(resultLabel)
        view.addSubview(가위바위보stackView)
        
        가위.addTarget(self, action: #selector(가위버튼누름), for: .touchUpInside)
        바위.addTarget(self, action: #selector(바위버튼누름), for: .touchUpInside)
        보.addTarget(self, action: #selector(보버튼누름), for: .touchUpInside)
        constraints()
    }
    
    /// MARK: Set AutoLayout
    private func constraints(){
        이미지stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(robotImage.snp.width)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(이미지stackView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        가위바위보stackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
    }
    
    /// MARK: 가위 버튼 눌렀을 때
    @objc
    private func 가위버튼누름(){
        selectedImageIndex = type.가위.rawValue
        myImage.image = imageType.가위
        setRobots()
    }
    
    /// MARK: 바위 버튼 눌렀을 때
    @objc
    private func 바위버튼누름(){
        selectedImageIndex = type.바위.rawValue
        myImage.image = imageType.바위
        setRobots()
    }
    
    /// MARK: 보 버튼 눌렀을 때
    @objc
    private func 보버튼누름(){
        selectedImageIndex = type.보.rawValue
        myImage.image = imageType.보
        setRobots()
    }
    
    /// MARK: 로봇이 낼 것
    private func setRobots(){
        robotImageIndex = Int.random(in: 0...2)
        switch robotImageIndex {
        case 0:
            robotImage.image = imageType.가위
        case 1:
            robotImage.image = imageType.바위
        case 2:
            robotImage.image = imageType.보
        default:
            fatalError("삐리삐리 오류발생!")
        }
        checkWinner()
    }
    
    /// MARK: 승자 확인
    private func checkWinner(){
        guard let selectedImageIndex = selectedImageIndex else {return}
        guard let robotImageIndex = robotImageIndex else {return}
        
        if selectedImageIndex == robotImageIndex {
            resultLabel.text = "무승부"
        }
        else if selectedImageIndex < robotImageIndex {
            if selectedImageIndex == 0 && robotImageIndex == 2 {
                resultLabel.text = "승리"
            }
            else{
                resultLabel.text = "이걸 진다고?"
            }
        }
        else{
            if selectedImageIndex == 2 && robotImageIndex == 0 {
                resultLabel.text = "이걸 진다고?"
            }
            else{
                resultLabel.text = "승리"
            }
        }
    }
}

