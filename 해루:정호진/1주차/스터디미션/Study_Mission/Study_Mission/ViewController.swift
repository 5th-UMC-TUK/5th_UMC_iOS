//
//  ViewController.swift
//  Study_Mission
//
//  Created by 정호진 on 2023/09/22.
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
    private lazy var imgView: UIImageView = {
        let view = UIImageView()
        
        return view
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
        view.addSubview(imgView)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(view.safeAreaLayoutGuide.layoutFrame.width*2/3)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.safeAreaLayoutGuide.layoutFrame.width*2/3)
        }
    }
    
    
    /// MARK:
    @objc
    private func clickedButton(){
        let random = Int.random(in: 0...5)
        imgView.image = list[random]
    }
    


}

