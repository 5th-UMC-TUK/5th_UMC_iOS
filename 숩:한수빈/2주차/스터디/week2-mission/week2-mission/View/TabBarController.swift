//
//  TabBarController.swift
//  week2-mission
//
//  Created by Subeen on 2023/09/25.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.selectedIndex = 0
        self.delegate = self
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        tabBar.backgroundColor = UIColor(ciColor: .white)
        
        
        let home = createNav(with: "홈", and: UIImage(systemName: "house.fill"), vc: HomeViewController())
        let country = createNav(with: "동네생활", and: UIImage(systemName: "house.fill"), vc: CountryViewController())
        let nearby = createNav(with: "내 근처", and: UIImage(systemName: "house.fill"), vc: NearbyViewController())
        let chat = createNav(with: "채팅", and: UIImage(systemName: "house.fill"), vc: ChatViewController())
        let my = createNav(with: "나의 당근", and: UIImage(systemName: "house.fill"), vc: MyViewController())
        
        self.setViewControllers([home, country, nearby, chat, my], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
}
