import Foundation
import SwiftUI

/// ViewModel для экрана входа (LoginView)
class LoginViewModel: ObservableObject {
    // Введённые пользователем данные для входа
    @Published var username: String = ""   // имя пользователя (логин)
    @Published var password: String = ""   // пароль

    /// Метод попытки входа (проверка введённых данных)
    func performLogin() -> Bool {
        // В реальном приложении нужна проверка логина/пароля
        // Для учебного примера вход успешен, если поля не пустые
        return !username.isEmpty && !password.isEmpty
    }
}
