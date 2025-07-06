import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Настройка корневого ViewController из Main.storyboard
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Обработка отключения сцены
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Сцена активна
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Сцена переходит в неактивное состояние
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Сцена возвращается на передний план
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Сцена ушла в фон
    }
}
