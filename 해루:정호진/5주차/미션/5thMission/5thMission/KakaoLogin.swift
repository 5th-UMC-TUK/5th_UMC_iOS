//
//  KakaoLogin.swift
//  5thMission
//
//  Created by 정호진 on 11/2/23.
//

import Foundation
import Alamofire
import RxSwift
import RxKakaoSDKUser
import KakaoSDKUser

final class KakaoLogin {
    private let disposeBag = DisposeBag()
    
    /// 카카오 로그인
    func kakaoLogin() -> Observable<KakaoSDKUser.User> {
        return Observable.create { [weak self] observer in
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.rx.loginWithKakaoTalk()
                    .flatMap { _ in self?.fetchKakaoUserInfo() ?? .empty() }
                    .subscribe(
                        onNext: { userInfo in
                            observer.onNext(userInfo)
                            observer.onCompleted()
                        },
                        onError: { error in
                            observer.onError(error)
                        }
                    )
                    .disposed(by: self?.disposeBag ?? DisposeBag())
                return Disposables.create()
            }
            
            UserApi.shared.rx.loginWithKakaoAccount()
                .flatMap { _ in self?.fetchKakaoUserInfo() ?? .empty() }
                .subscribe(
                    onNext: { userInfo in
                        observer.onNext(userInfo)
                    },
                    onError: { error in
                        print("loginWithKakaoAccount() error: \(error)")
                    }
                )
                .disposed(by: self?.disposeBag ?? DisposeBag())
            return Disposables.create()
        }
    }
    
    /// 카카오 사용자 정보 불러오기
    func fetchKakaoUserInfo() -> Observable<KakaoSDKUser.User> {
        return UserApi.shared.rx.me().asObservable()
            .do(onNext: { user in
                print("fetchKakaoUserInfo \n\(user)")
            }, onError: { error in
                print("fetchKakaoUserInfo error!\n\(error)")
            })
    }
}
