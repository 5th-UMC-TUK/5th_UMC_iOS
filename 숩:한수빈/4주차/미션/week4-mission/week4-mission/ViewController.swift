//
//  ViewController.swift
//  week4-mission
//
//  Created by Subeen on 2023/10/09.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var emailString: String = ""
    private var passwordString: String = ""

    // MARK: - 로그인 상태 뷰
    private lazy var statusLabel: UILabel = {
       let lb = UILabel()
        lb.text = "안녕"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 15, weight: .light)

        return lb
    }()
    
    
    
    // MARK: - 자동로그인
    private lazy var autoLoginStack: UIStackView = {
       let st = UIStackView(arrangedSubviews: [statusLabel, autoLoginLabel, autoLoginToggle])
        st.axis = .horizontal
        return st
    }()
    
    private lazy var autoLoginLabel: UILabel = {
       let lb = UILabel()
        lb.text = "자동로그인"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 15, weight: .light)
        return lb
    }()
    
    private lazy var autoLoginToggle: UISwitch = {
       let sw = UISwitch()
        return sw
    }()
    
    // MARK: - 이메일 입력하는 텍스트 뷰
    // private : 클래스 내부에서만 접근 가능
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    // "이메일 또는 전화번호" 안내문구
    private let emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return label
    }()
    
    // 로그인 - 이메일 입력 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        //        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {  // (2) 이 뷰에 아래 3가지 것들이 추가돼야 하므로
        let view = UIView()                             // lazy var 로 선언
        //view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)      // (1) 여기에 있는  3가지가 먼저 메모리에 올라가고
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    // 패스워드텍스트필드의 안내문구
    private let passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return label
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // 패스워드에 "표시"버튼 비밀번호 가리기 기능
    private lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    // MARK: - 로그인버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
                button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - 회원가입 버튼
    private lazy var signupButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
                button.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 이메일텍스트필드, 패스워드, 로그인버튼 스택뷰에 배치
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [autoLoginStack, emailTextFieldView, passwordTextFieldView, loginButton, signupButton])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    
    // 비밀번호 재설정 버튼
    private lazy var passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped  ), for: .touchUpInside)
        return button
    }()
    
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48
    
    
    // 오토레이아웃 향후 변경을 위한 변수(애니메이션)
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // emailTextField, passwordTextField 둘의 대리자가 ViewController가 된다
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        print()
        configure()
        setupAutoLayout()
    }
    
    // 셋팅
        private func configure() {
            view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.07450980392, blue: 0.07450980392, alpha: 1)
//            emailTextField.delegate = self
//            passwordTextField.delegate = self
            [stackView, passwordResetButton].forEach { view.addSubview($0) }
        }
    
    // 오토레이아웃
    private func setupAutoLayout() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        autoLoginToggle.translatesAutoresizingMaskIntoConstraints = false
        autoLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        autoLoginStack.translatesAutoresizingMaskIntoConstraints = false
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            
            // Label을 동적으로 움직이게 할 것임. 고정 값을 두면 안 됨. 위에서 만든 변수 emailInfoLabelCenterYConstraint 를 사용.
            //emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor).isActive = true
            emailInfoLabelCenterYConstraint,
        
        
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            
            
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            // Label을 동적으로 움직이게 할 것임. 고정 값을 두면 안 됨. 위에서 만든 변수 passwordInfoLabelCenterYConstraint 를 사용.
            //passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabelCenterYConstraint,
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // 표시 버튼
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            // 표시 버튼은 오른쪽 끝에 붙어있기 때문에, 끝만 맞춤
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            //텍스트뷰의 높이 설정
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*5 + 36),
            
            
            
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    // TODO: - 다음엔 꼭 스냅킷 사용하겠습니다 ...
    private func setupAutoLayout2() {
        
//        emailInfoLabel.snp.makeConstraints { make in
//            make.leading.equalTo(self.emailTextFieldView.snp.leading).offset(8)
//            make.trailing.equalTo(self.emailTextFieldView.snp.trailing).offset(-8)
//            make.centerY.equalTo(self.emailTextFieldView.snp.centerY)
//        }
//
        
        NSLayoutConstraint.activate([
//            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
//            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            
            // Label을 동적으로 움직이게 할 것임. 고정 값을 두면 안 됨. 위에서 만든 변수 emailInfoLabelCenterYConstraint 를 사용.
//            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
        
        
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            
            
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            // Label을 동적으로 움직이게 할 것임. 고정 값을 두면 안 됨. 위에서 만든 변수 passwordInfoLabelCenterYConstraint 를 사용.
            //passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // 표시 버튼
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            // 표시 버튼은 오른쪽 끝에 붙어있기 때문에, 끝만 맞춤
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            //텍스트뷰의 높이 설정
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*4 + 36),
            
            
            
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    @objc func passwordSecureModeSetting() {
        print("표시버튼이 눌렸습니다.")
        passwordTextField.isSecureTextEntry.toggle()    // togle() : 참 <-> 거짓 전환
    }
    
    @objc func loginButtonTapped() {
        print("로그인 버튼이 눌렸습니다.")
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == UserDefaults.standard.string(forKey: "email") {
            if password == UserDefaults.standard.string(forKey: "password") {
                statusLabel.text = "로그인 성공"
                statusLabel.textColor = .systemBlue
                print("로그인 성공")
                
                // 자동로그인 설정
                if autoLoginToggle.isOn {
                    UserDefaults.standard.setValue(true, forKey: "autoLogin")
                }
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(SecondViewController())

//                if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
//                    scene.changeRootViewController(SecondViewController())
//                }
//                navigationController?.pushViewController(SecondViewController(), animated: true)
                
            } else {
                statusLabel.text = "틀린 비밀번호입니다."
                statusLabel.textColor = .systemRed
                print("틀린 비밀번호입니다.")
            }
        } else {
            statusLabel.text = "존재하지 않은 아이디입니다."
            statusLabel.textColor = .systemRed
            print("존재하지 않은 아이디입니다.")
        }
    }
    
    @objc func signinButtonTapped() {
        print("회원가입 버튼이 눌렸습니다.")
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == UserDefaults.standard.string(forKey: "email") {
            statusLabel.text = "이미 존재하는 아이디입니다."
            statusLabel.textColor = .systemRed
            print("이미 존재하는 아이디입니다.")
        } else {
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(password, forKey: "password")
            statusLabel.text = "회원가입 성공"
            statusLabel.textColor = .systemBlue
            print("회원가입 성공")
        }
    }
    
    
    // selector로 만들었기 때문에 @objc 키워드를 써야 함.
    @objc func resetButtonTapped() {
//        print("리셋 버튼이 눌렸습니다.")
        let alertCont = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)

        let success = UIAlertAction(title: "확인", style: .default) { action in
            // 확인을 누르고 나면, 어떤 액션이 전달되는지 클로저로 작성.
            print("확인버튼이 눌렸습니다.")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼이 눌렸습니다.")
        }
        
        // 만든 alert컨트롤러창에 action 올리기
        alertCont.addAction(success)
        alertCont.addAction(cancel)
        
        // 비밀번호 재설정을 눌렀을 때, alert컨트롤러창으로 넘어가는 메서드
        present(alertCont, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
      

// FieldDelegate : TextField를 조정하기 위해서.
// TextField를 사용할 때는 델리게이트 패턴 사용해야 함. TextField에는 디테일한 기능이 있음.

// extension 으로 따로 구현함으로써, 함수 정리 가능 (선택적인 요구사항)
extension ViewController : UITextFieldDelegate {
    /*
     작성 시작할 때 background 색, 폰트 크기...
     작성 종료될 때 background 색, 폰트 크기...
     */
    
    
    
    
    // 애니메이션 효과 주기
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // 유저가 선택한 필드가 emailTextField일 때
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11) // Label의 폰트 크기 변경
            // 오토레이아웃 업데이트
            // constant : 숫자
            emailInfoLabelCenterYConstraint.constant = -13  // 오토레이아웃 동적으로 바꾸기
        }
        
        // 유저가 선택한 필드가 passwordTextField일 때
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
    }
    
    // textField의 입력이 끝날 때
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            // 빈칸이면 원래로 되돌리기
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            // stackView 내부에 있는 모든 것에 애니메이션 효과를 줌.
            // 자연스럽게 애니메이션 효과
            self.stackView.layoutIfNeeded()
            
            // 위에 처럼 스택뷰 하위에 있는 모든 뷰에 효과 적용 / 뷰에 각각 효과 적용
            // self.emailTextFieldView.layoutIfNeeded()
            // self.passwordTextFieldView.layoutIfNeeded()
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            // 빈칸이면 원래로 되돌리기
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        }
    }
    
    
    // 로그인 버튼 빨갛게 만들기
    // 1. 한 글자 입력될 때마다 함수가 호출됨.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//    }
    
    // 2. addTarget
    // MARK: - 이메일텍스트필드, 비밀번호 텍스트필드 두가지 다 채워져 있을때, 로그인 버튼 빨간색으로 변경
    @objc func textFieldEditingChanged(_ textField: UITextField){
        if textField.text?.count == 1 {
            if textField.text?.first == " " {   // 빈 문자일 경우 함수 리턴(벗어남)
                textField.text = ""
                return
            }
        }
        guard
            let email = emailTextField.text, !email.isEmpty,        // 필드에 글씨가 있고, 이메일이 비어있지 않으면
            let password = passwordTextField.text, !password.isEmpty    // 필드에 글씨가 있고, 패스워드가 비어있지 않으면
        else {
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            
            signupButton.backgroundColor = .clear
            signupButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true

        signupButton.backgroundColor = .red
        signupButton.isEnabled = true
    }
}
        


