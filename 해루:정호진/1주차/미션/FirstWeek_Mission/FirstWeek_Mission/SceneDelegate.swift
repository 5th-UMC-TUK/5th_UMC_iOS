//
//  SceneDelegate.swift
//  FirstWeek_Mission
//
//  Created by 정호진 on 2023/09/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabbarController = UITabBarController()
        tabbarController.tabBar.backgroundColor = .white
        tabbarController.setViewControllers([ViewController(),ViewController(),ViewController(),ViewController(),ViewController()], animated: true)
        
        if let item = tabbarController.tabBar.items {
            item[0].image = UIImage(named: "a")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[0].title = "검색"
            
            item[1].image = UIImage(named: "a")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[1].title = "검색"
            
            item[2].image = UIImage(named: "a")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[2].title = "검색"
            
            item[3].image = UIImage(named: "a")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[3].title = "검색"
            
            item[4].image = UIImage(named: "a")?.resize(newWidth: 20).withRenderingMode(.alwaysOriginal)
            item[4].title = "검색"
        }
        
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }
}

