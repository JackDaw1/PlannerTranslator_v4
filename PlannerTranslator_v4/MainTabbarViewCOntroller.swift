import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
//        UITabBar.appearance().barTintColor = .systemBackground
//          tabBar.tintColor = .label
        generateTabBar()
        setTabBarAppearance()
    }

    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           //navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }
     
    
    private func generateTabBar() {
        viewControllers = [
            createNavController(
                for: OrderListRouter.createOrderListModule(),
                title: "Профиль",
                image: UIImage(systemName: "person.circle")!
            )
//            createNavController(
//                for: PersonViewController(),
//                title: "Профиль",
//                image: UIImage(systemName: "person.circle")!
//            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
  
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        //let roundLayer = CAShapeLayer()
        /*
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        */
        
        tabBar.itemWidth = width / 4
        tabBar.itemPositioning = .centered
    }

    
}
