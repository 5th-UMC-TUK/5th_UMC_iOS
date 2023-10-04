//
//  ViewController.swift
//  SecondWeek_StudyMission
//
//  Created by 정호진 on 2023/09/30.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    /// MARK:
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("클릭!", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .lightGray
        btn.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return btn
    }()
    
    /// MARK:
    private lazy var imgView1: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    /// MARK:
    private lazy var imgView2: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    /// MARK:
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imgView1,imgView2] )
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    /// MARK:
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let list: [UIImage] = [UIImage(named: "1")!,
                                   UIImage(named: "2")!,
                                   UIImage(named: "3")!,
                                   UIImage(named: "4")!,
                                   UIImage(named: "5")!,
                                   UIImage(named: "6")!,]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addUI()
    }
    
    /// MARK:
    private func addUI(){
        view.addSubview(button)
        view.addSubview(stackView)
        view.addSubview(label)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.width*2/3)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.safeAreaLayoutGuide.layoutFrame.width*2/3)
        }
        
        
    }
    
    
    /// MARK:
    @objc
    private func clickedButton(){
        let random1 = Int.random(in: 0...5)
        imgView1.image = list[random1]
        
        let random2 = Int.random(in: 0...5)
        imgView2.image = list[random2]
        
        logic(first: random1, second: random2)
    }
    
    /// MARK: Logic
    private func logic(first: Int, second: Int){
        if first == second {
            label.text = "더블"
        }
        else{
            label.text = "다시 돌려주세요"
        }
        
    }
    


}

