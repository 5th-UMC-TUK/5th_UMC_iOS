//
//  LoginViewController.swift
//  5thMission
//
//  Created by 정호진 on 11/2/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {
    private let service = KakaoLogin()
    private let disposeBag = DisposeBag()
    
    /// MARK:
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Kakao Login", for: .normal)
        btn.backgroundColor = .yellow
        btn.layer.cornerRadius = 20
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        bind()
    }
    
    /// MARK:
    private func addSubViews(){
        view.addSubview(loginButton)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        loginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.safeAreaLayoutGuide.layoutFrame.width*2/3)
            make.height.equalTo(70)
        }
    }
    
    /// MARK:
    private func bind(){
        loginButton.rx.tap
            .bind { [weak self] in
                self?.getData()
            }
            .disposed(by: disposeBag)
    }
    
    /// MARK:
    private func getData(){
        service.kakaoLogin()
            .bind { [weak self] data in
                guard let self = self else {return}
                let listViewController = ListViewController()
                listViewController.name = data.kakaoAccount?.profile?.nickname ?? ""
                navigationController?.pushViewController(listViewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
