![](../assets/swift-source-file.jpg)

[Переход на Главную страницу](../README.md)
<hr><hr>

# Разработка приложения на основе языка Swift.
## Уроки 1 и 2: Знакомство с приложением
### Описание
- Создание проекта
- Жизненный цикл приложения
    - Методы AppDelegate
- UIViewController
    - Жизненный цикл контроллера
    - Создание нового контроллера
    - Переход между контроллерами
    - present
    - addChild
    - viewWillDisappear и viewDidDisappear
- Добавление элементов на экран
    - frame и bounds
    - Добавление элементов
- Auto Layout
- UITabBarController и UINavigationController
    - UITabBarController
    - UINavigationController
- UIButton
    - Responder Chain
- Storyboard

<br>
<hr><hr>

# Реализация формы входа двумя способами (с Storyboard и без)
##
## Задание

1. Создать **два проекта**:
    - **Проект 1** - удалить все упоминания `Storyboard`, реализовать UI в коде.
    - **Проект 2** - оставить `Storyboard`, реализовать UI через него.

2. Реализовать **экран с полями ввода "Логин" и "Пароль"**, и кнопкой "Войти".

##
## Часть 1. Создание двух проектов

### Проект 1: `LoginNoStoryboard`

1. Открыть Xcode → `File` → `New` → `Project...`
2. Тип: `App`, Interface: `Storyboard`
3. Название: `LoginNoStoryboard`, язык: `Swift`

**Удаление Storyboard:**
- Удалить `Main.storyboard`
- Удалить строку `Main storyboard file base name` из `Info.plist`
- В `SceneDelegate.swift` заменить `rootViewController`:

```swift
guard let windowScene = (scene as? UIWindowScene) else { return }
window = UIWindow(windowScene: windowScene)
window?.rootViewController = LoginViewController()
window?.makeKeyAndVisible()
```

- Удалить `@IBOutlet var window` из `AppDelegate.swift`
- Создать `LoginViewController.swift` вручную

##
### Проект 2: `LoginWithStoryboard`

1. Создать как обычное приложение с `Storyboard`
2. Убедиться, что `Main.storyboard` и `ViewController` присутствуют
3. Установить `LoginViewController` в Identity Inspector

##
## Часть 2. Реализация UI без Storyboard (Проект 1)
### LoginViewController.swift

```swift
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
```

##
## Часть 3. Реализация UI через Storyboard (Проект 2)

1. Открыть `Main.storyboard`
2. Добавить:
    - 2 `UITextField` → placeholders: "Логин", "Пароль"
    - 1 `UIButton` → title: "Войти"
3. Привязать элементы к `LoginViewController.swift`

### LoginViewController.swift

```swift
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
    }
}
```

##
## Результат

| Проект  | Способ UI           | Примечание                    |
|---------|---------------------|-------------------------------|
| #1      | Только код          | Полностью без Storyboard      |
| #2      | Через Storyboard    | Вся разметка визуально        |

**Функциональность**: поля для ввода логина и пароля, кнопка "Войти", базовая стилизация и компоновка.


<br>
<hr><hr>

## Решение задания
# Инструкция по выполнению:
## Цель задания

Создать два iOS-приложения на Swift:
- В одном интерфейс реализован **программно (без Storyboard)**.
- В другом - с использованием **Storyboard**.

Обе формы должны содержать:
- Поле "Логин"
- Поле "Пароль"
- Кнопку "Войти"

##
## Проект 1: LoginNoStoryboard
### Шаг 1: Создание проекта

1. Открыть **Xcode** → `File` -> `New` → `Project...`
2. Выбрать **App**
3. Указать:
    - Product Name: `LoginNoStoryboard`
    - Interface: `Storyboard`
    - Language: `Swift`
4. Нажать **Next** и сохранить проект

##
### Шаг 2: Удаление Storyboard

1. Удалить файл `Main.storyboard`
2. Открыть `Info.plist` и удалить ключ:
   ```
   Application Scene Manifest -> Scene Configuration -> Application Session Role -> Item 0 -> Storyboard Name
   ```
3. В `SceneDelegate.swift` заменить `rootViewController`:

```swift
guard let windowScene = (scene as? UIWindowScene) else { return }
window = UIWindow(windowScene: windowScene)
window?.rootViewController = LoginViewController()
window?.makeKeyAndVisible()
```

4. Удалить строку `@IBOutlet var window` из `AppDelegate.swift` (если есть)
5. Создать новый файл `LoginViewController.swift`

##
### Шаг 3: Реализация UI программно

**LoginViewController.swift:**

```swift
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
```

##
## Проект 2: LoginWithStoryboard
### Шаг 1: Создание проекта

1. Создать новый проект **App**
2. Указать:
    - Product Name: `LoginWithStoryboard`
    - Interface: `Storyboard`
    - Language: `Swift`

##
### Шаг 2: Настройка Storyboard

1. Убедиться, что `Main.storyboard` и `ViewController.swift` присутствуют
2. В Storyboard:
    - Установить `ViewController` как `LoginViewController` в Identity Inspector
    - Добавить:
        - 2 `UITextField` с `placeholder`: "Логин", "Пароль"
        - 1 `UIButton` с `title`: "Войти"
3. Установить констрейнты Auto Layout для всех элементов

##
### Шаг 3: Привязка IBOutlet

**LoginViewController.swift:**

```swift
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
    }
}
```

> Все `IBOutlet` необходимо привязать вручную через Assistant Editor.

##
## Результат

| Проект                | Способ реализации UI | Особенности                  |
|-----------------------|----------------------|------------------------------|
| `LoginNoStoryboard`   | Программно (код)     | Без использования Storyboard |
| `LoginWithStoryboard` | Через Storyboard     | Визуальное построение формы  |

##
## Проверка результата

- Протестировать оба приложения на симуляторе.
- Проверить, что поля работают корректно и текст вводится.
- Использовать Auto Layout для адаптивности интерфейса.

```swift
NSLayoutConstraint.activate([
    // Пример установки констрейнтов для текстового поля
])
```

##

<br><br>

[Переход на Главную страницу](../README.md)
<hr><hr>