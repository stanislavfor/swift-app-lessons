import SwiftUI

@main
struct Seminar2App: App {
    @State private var isLoggedIn: Bool = false  // флаг состояния входа

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                // После "входа" отображаем главный экран с TabView
                MainTabView()
            } else {
                // Экран входа. Передаем замыкание, которое изменит isLoggedIn
                LoginView(onLogin: {
                    self.isLoggedIn = true
                })
            }
        }
    }
}
