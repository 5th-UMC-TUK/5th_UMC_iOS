//
//  ViewController.swift
//  Misson4
//
//  Created by 이정동 on 10/5/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var topLabel: UILabel = {
        let view = UILabel()
        view.text = "로그인 화면"
        return view
    }()
    
    private lazy var tfStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private lazy var idTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    private lazy var pwTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    private lazy var btnStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("로그인", for: .normal)
        view.backgroundColor = .gray
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private lazy var joinButton: UIButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        view.backgroundColor = .gray
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
        view.addSubview(topLabel)
        view.addSubview(tfStackView)
        view.addSubview(btnStackView)
        
        tfStackView.addArrangedSubview(idTextField)
        tfStackView.addArrangedSubview(pwTextField)
        
        btnStackView.addArrangedSubview(loginButton)
        btnStackView.addArrangedSubview(joinButton)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            make.centerX.equalToSuperview()
        }
        
        tfStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(100)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
        
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(tfStackView.snp.bottom).offset(100)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
    }
    
    private func addTargets() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        joinButton.addTarget(self, action: #selector(joinButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        guard let userInfo = UserDefaults.standard.object(forKey: idTextField.text!) as? [String: String] else {
            topLabel.text = "존재하지 않는 ID"
            return
        }
        
        guard pwTextField.text! == userInfo["pw"] else {
            topLabel.text = "비밀번호 불일치"
            return
        }
        
        UserDefaults.standard.setValue("", forKey: "@")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(SecondViewController())
    }
    
    @objc func joinButtonTapped() {
        // 이미 등록된 id인지 확인
        guard UserDefaults.standard.object(forKey: idTextField.text!) == nil else {
            topLabel.text = "이미 존재하는 ID"
            return
        }
        
        // 유저 id, pw 정보
        let userInfo: [String: String] = ["id" : idTextField.text!, "pw" : pwTextField.text!]
        
        // 등록
        UserDefaults.standard.set(userInfo, forKey: idTextField.text!)
        topLabel.text = "회원가입 성공"
    }
}

