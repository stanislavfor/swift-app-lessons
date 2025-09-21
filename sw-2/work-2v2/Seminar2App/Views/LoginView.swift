import SwiftUI

/// Экран входа в приложение
struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()  // привязываем ViewModel для экрана входа
    var onLogin: () -> Void   // замыкание, выполняемое при успешном "входе" (нажатии кнопки)

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Поля ввода логина и пароля
                TextField("Логин", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                SecureField("Пароль", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                // Кнопка "Войти"
                Button(action: {
                    // При нажатии проверяем введенные данные
                    if viewModel.performLogin() {
                        onLogin()  // вызываем замыкание, чтобы перейти к основному экрану
                    }
                }) {
                    Text("Войти")
                        .font(.headline)
                        .padding(.horizontal, 60).padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty)
                // Кнопка отключена, если поля логина/пароля пустые

            }
            .padding()
            .navigationTitle("Авторизация")  // заголовок в навигационной панели
        }
    }
}
