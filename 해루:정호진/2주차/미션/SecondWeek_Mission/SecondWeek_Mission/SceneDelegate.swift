//
//  SceneDelegate.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/09/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabbarController = UITabBarController()
        tabbarController.tabBar.backgroundColor = .white
        
        let nc = UINavigationController(rootViewController: ViewController())
        
        tabbarController.setViewControllers([nc,ViewController(),ViewController(),ViewController(),ViewController()], animated: true)
        
        if let item = tabbarController.tabBar.items {
            item[0].image = UIImage(named: "a")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[0].title = "홈"
            
            item[1].image = UIImage(named: "b")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[1].title = "동네생활"
            
            item[2].image = UIImage(named: "c")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[2].title = "내 근처"
            
            item[3].image = UIImage(named: "d")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[3].title = "채팅"
            
            item[4].image = UIImage(named: "e")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[4].title = "나의 당근"
        }
        
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }
}

