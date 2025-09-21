import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // iOS 13+ — сцены управляются через SceneDelegate
    func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle (iOS 13+)
    func application(_ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration",
            sessionRole: connectingSceneSession.role)
    }
}
