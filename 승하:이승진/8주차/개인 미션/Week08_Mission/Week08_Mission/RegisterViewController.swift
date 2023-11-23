//
//  RegisterViewController.swift
//  Week08_Mission
//
//  Created by 이승진 on 2023/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    // 유효성검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidNickName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    // 회원가입 - 이메일 입력 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.textColor = .white
        tf.tintColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none // 자동으로 앞에 글자를 대문자로 바꾸는 설정
        tf.autocorrectionType = .no // 자동으로 틀린 글자 잡아주는 설정
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress // 이메일 주소 타입
        tf.placeholder = "  이메일 또는 전화번호"
        tf.setPlaceholderColor(.white)
        return tf
    }()
    
    // 회원 가입 - 성명
    private lazy var nameTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.textColor = .white
        tf.tintColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none // 자동으로 앞에 글자를 대문자로 바꾸는 설정
        tf.autocorrectionType = .no // 자동으로 틀린 글자 잡아주는 설정
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress // 이메일 주소 타입
        tf.placeholder = "  성명"
        tf.setPlaceholderColor(.white)
        return tf
    }()
    
    // 회원가입 - 사용자 이름
    private lazy var nickNameTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.textColor = .white
        tf.tintColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none // 자동으로 앞에 글자를 대문자로 바꾸는 설정
        tf.autocorrectionType = .no // 자동으로 틀린 글자 잡아주는 설정
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress // 이메일 주소 타입
        tf.placeholder = "  사용자 이름"
        tf.setPlaceholderColor(.white)
        return tf
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.frame.size.height = 48
        tf.textColor = .white
        tf.tintColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = false // 비밀번호를 가리는 설정
        tf.clearsOnBeginEditing = false
        tf.placeholder = "  비밀번호"
        tf.setPlaceholderColor(.white)
        return tf
    }()
    
    //MARK: - 가입 버튼
    private let signupButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5  // 둥글게
        button.clipsToBounds = true // 영역내로 잘라냄
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) //선
        button.setTitle("가입하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false // 처음 버튼 비활성화하는 코드
        button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextField, nameTextField, nickNameTextField, passwordTextField, signupButton])
        st.spacing = 18
        st.axis = .vertical // 축 설정 (가로, 세로)
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    var textFields: [UITextField] { // 연산 프로퍼티
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        makeUI()
        
        // bug fix (스와이프)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil

    }
    
    func makeUI() {
        view.backgroundColor = UIColor.black

        view.addSubview(stackView) // 가장 아래있는 view에 stackView 올리기
        
        let safeArea = view.safeAreaLayoutGuide
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ //.isActive = true 생략
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*5 + 36)
        ])
    }
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nickNameTextField:
            self.isValidNickName = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text

        default:
            fatalError("Missing TextField..")
        }
    }
    
    
    @objc
    func signupButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    //MARK: - Helpers
    private func setupTextField() {
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector( textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        
        if isValidEmail
            && isValidName
            && isValidNickName
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .red
            }
            
        } else {
            // 유효성 검사 -> 유효화하지 않음
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .black
            }
        }
    }
}

// 정규 표현식
extension String {
    // 대문자, 소문자, 특수문자, 숫자, 8자 이상일 때 -> true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with:self)
    }
    
    // @ 2글자
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}

public extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
}
