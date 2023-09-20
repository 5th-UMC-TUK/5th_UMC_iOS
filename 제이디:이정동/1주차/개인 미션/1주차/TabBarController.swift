//
//  TabBarController.swift
//  1주차
//
//  Created by 이정동 on 2023/09/18.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = ViewController()
        let vc2 = ViewController()
        let vc3 = ViewController()
        let vc4 = ViewController()
        let vc5 = ViewController()
        
        vc1.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        vc2.tabBarItem = UITabBarItem(title: "찜", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart"))
        vc3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle"))
        vc4.tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait"))
        vc5.tabBarItem = UITabBarItem(title: "my배민", image: UIImage(systemName: "face.smiling.inverse"), selectedImage: UIImage(systemName: "face.smiling.inverse"))
        
        self.tabBar.tintColor = .darkGray
        self.tabBar.backgroundColor = .white
        
        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        self.selectedViewController = vc3
    }
    

}
