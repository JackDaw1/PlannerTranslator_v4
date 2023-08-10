import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        generateTabBar()
        setTabBarAppearance()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image:  UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        rootViewController.navigationItem.title = title
        return navController
    }
    
    private func generateTabBar() {
        viewControllers = [
            createNavController(
                for: OrderListRouter.createOrderListModule(),
                title: "Заказы",
                image: UIImage(named: "orders.png")!
            ),
            createNavController(
                for: CustomerListRouter.createCustomerListModule(),
                title: "Заказчики",
                image: UIImage(named: "customer.png")!
            ),
            createNavController(
                for: IncomeListRouter.createIncomeListModule(),
                title: "Смета",
                image: UIImage(named: "money.png")!
            ),
            createNavController(
                for: ProfileDetailRouter.createProfileDetailRouterModule(),
                title: "Профиль",
                image: UIImage(named: "profile.png")!
            )
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
        
        tabBar.itemWidth = width / 4
        tabBar.itemPositioning = .centered
    }
    
}
