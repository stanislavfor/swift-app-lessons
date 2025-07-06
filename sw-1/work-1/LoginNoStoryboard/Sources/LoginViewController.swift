import UIKit

class LoginViewController: UIViewController {

    private let loginField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Логин"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let passwordField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Войти", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginField.widthAnchor.constraint(equalToConstant: 250),

            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 20),
            passwordField.widthAnchor.constraint(equalToConstant: 250),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
