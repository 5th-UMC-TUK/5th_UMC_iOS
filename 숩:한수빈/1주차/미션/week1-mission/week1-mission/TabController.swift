//
//  TabController.swift
//  week1-study
//
//  Created by Subeen on 2023/09/23.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.selectedIndex = 2  // 기본 화면 Home
        
        self.delegate = self
        
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        tabBar.backgroundColor = UIColor(.white)

        tabBar.layer.cornerRadius = tabBar.frame.height * 0.41
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        
        let home = self.createNav(with: " ", and: UIImage(named: "Home1"), vc: HomeViewController())
        let search = self.createNav(with: "검색", and: UIImage(named: "Search"), vc: SearchViewController())
        let favorite = self.createNav(with: "찜", and: UIImage(named: "Favorite"), vc: FavoriteViewController())
        let order = self.createNav(with: "주문내역", and: UIImage(named: "Order"), vc: OrderViewController())
        let my = self.createNav(with: "my 배민", and: UIImage(named: "My"), vc: MyViewController())
        
        
        
        self.setViewControllers([search, favorite, home, order, my], animated: true)

    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        
        return nav
    }
}
