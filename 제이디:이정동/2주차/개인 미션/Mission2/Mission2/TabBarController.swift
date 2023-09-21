import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: ViewController())
        let vc2 = ViewController()
        let vc3 = ViewController()
        let vc4 = ViewController()
        let vc5 = ViewController()
        
        vc1.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        vc2.tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        vc3.tabBarItem = UITabBarItem(title: "내 근처", image: UIImage(systemName: "mappin.and.ellipse"), selectedImage: UIImage(systemName: "mappin.and.ellipse"))
        vc4.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "bubble.left.and.bubble.right"), selectedImage: UIImage(systemName: "bubble.left.and.bubble.right.fill"))
        vc5.tabBarItem = UITabBarItem(title: "나의 당근", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
        
        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
    }
    

}
