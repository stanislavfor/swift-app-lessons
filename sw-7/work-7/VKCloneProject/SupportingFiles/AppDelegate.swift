import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Здесь производится запуск, точка запуска приложения
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // Освобождение ресурсов, если сцена была удалена
        // Если вы не используете мультисценарность, то метод можно оставить пустым
        for session in sceneSessions {
                    let discardedSceneId = session.persistentIdentifier
                    print("Сцена с идентификатором \(discardedSceneId) была удалена.")

                    // Пример: удаление кэша или временных данных, связанных с конкретной сценой.
                    // if let sceneData = SceneCache.shared.get(for: discardedSceneId) {
                    //     SceneCache.shared.remove(for: discardedSceneId)
                    //     print("Удалены ресурсы сцены \(discardedSceneId)")
                    // }
                }
    }
}
