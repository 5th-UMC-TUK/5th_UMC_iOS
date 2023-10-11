//
//  ViewController.swift
//  Mission5
//
//  Created by 이정동 on 10/11/23.
//

import UIKit
import SnapKit
import KakaoSDKUser

class ViewController: UIViewController {
    
    private lazy var kakaoButton: UIButton = {
        let view = UIButton()
        view.setTitle("카카오 로그인", for: .normal)
        view.backgroundColor = .yellow
        view.setTitleColor(.black, for: .normal)
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
        view.addSubview(kakaoButton)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        kakaoButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
    }
    
    private func addTargets() {
        kakaoButton.addTarget(self, action: #selector(kakaoButtonTapped), for: .touchUpInside)
    }
    
    @objc func kakaoButtonTapped() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                
                self.navigationController?.pushViewController(SecondViewController(), animated: true)
            }
        }
    }
}

