import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let friendsVC = UINavigationController(rootViewController: FriendsViewController())
        friendsVC.tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(systemName: "person.2"), tag: 0)

        let groupsVC = UINavigationController(rootViewController: GroupsViewController())
        groupsVC.tabBarItem = UITabBarItem(title: "Группы", image: UIImage(systemName: "person.3"), tag: 1)

        tabBarController.viewControllers = [friendsVC, groupsVC]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
