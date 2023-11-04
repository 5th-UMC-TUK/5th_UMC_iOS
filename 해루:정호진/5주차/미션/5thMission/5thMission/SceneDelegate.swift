//
//  SceneDelegate.swift
//  5thMission
//
//  Created by 정호진 on 10/30/23.
//

import UIKit
import KakaoSDKAuth

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let nc = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
    
    ///mark: -카카오로그인 설정
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.rx.handleOpenUrl(url: url)
            }
        }
    }
}
