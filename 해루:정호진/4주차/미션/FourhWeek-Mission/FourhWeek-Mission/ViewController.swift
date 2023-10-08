//
//  ViewController.swift
//  FourhWeek-Mission
//
//  Created by 정호진 on 10/7/23.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class ViewController: UIViewController {

    /// MARK: id textfield
    private lazy var idTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "아이디 입력"
        view.textColor = .black
        return view
    }()
    
    /// MARK: password textfield
    private lazy var pwTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "비밀번호 입력"
        view.textColor = .black
        return view
    }()
    
    /// MARK: 로그인 버튼
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(clickedSignIn), for: .touchUpInside)
        return btn
    }()
    
    /// MARK: 회원가입 버튼
    private lazy var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(clickedSignUp), for: .touchUpInside)
        return btn
    }()
    
    private var id: BehaviorRelay<String> = BehaviorRelay(value: "")
    private var pw: BehaviorRelay<String> = BehaviorRelay(value: "")
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        clear()
        addSubViews()
        bind()
    }
    
    /// MARK:
    private func addSubViews(){
        view.addSubview(idTextfield)
        view.addSubview(pwTextfield)
        view.addSubview(loginBtn)
        view.addSubview(signUpBtn)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        idTextfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        pwTextfield.snp.makeConstraints { make in
            make.top.equalTo(idTextfield.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(pwTextfield.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
        
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
    }
    
    /// MARK:
    private func clear(){
        UserDefaults.standard.removeObject(forKey: UserDefaultType.Id.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultType.Pw.rawValue)
    }
    
    /// MARK: binding textField
    private func bind(){
        idTextfield.rx.text
            .bind { [weak self] text in
                guard let self = self else {return}
                guard let text = text else {return}
                id.accept(text)
            }
            .disposed(by: disposeBag)
        
        pwTextfield.rx.text
            .bind { [weak self] text in
                guard let self = self else {return}
                guard let text = text else {return}
                pw.accept(text)
            }
            .disposed(by: disposeBag)
        
        
    }
    
    /// MARK: 회원가입 버튼 눌렀을 때
    @objc
    private func clickedSignUp(){
        if id.value != "" && pw.value != "" {
            let saveId = UserDefault.shared.load(type: UserDefaultType.Id.rawValue)
            let savePw = UserDefault.shared.load(type: UserDefaultType.Pw.rawValue)
            
            if saveId == id.value && savePw == pw.value {
                alert(title: "이미 존재하는 아이디입니다.", message: nil)
            }
            else if UserDefault.shared.save(info: id.value, type: UserDefaultType.Id.rawValue) &&
                        UserDefault.shared.save(info: pw.value, type: UserDefaultType.Pw.rawValue) {
                alert(title: "회원가입 성공", message: nil)
            }
            
        }
        else{
            alert(title: "회원가입 실패", message: nil)
        }
    }
    
    /// MARK: 로그인 버튼 눌렀을 때
    @objc
    private func clickedSignIn(){
        let saveId = UserDefault.shared.load(type: UserDefaultType.Id.rawValue)
        let savePw = UserDefault.shared.load(type: UserDefaultType.Pw.rawValue)
        
        if saveId == id.value && savePw == pw.value {
            alert(title: "로그인 성공", message: nil)
        }
        else{
            alert(title: "로그인 실패", message: "Id, 비밀번호를 확인해 주세요")
        }
        
    }
    
    /// MARK: 알림
    private func alert(title: String?, message: String?){
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        ac.addAction(confirm)
        present(ac,animated: true)
    }
    
    
}

