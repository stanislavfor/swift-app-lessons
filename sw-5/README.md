![](../assets/swift-source-file.jpg)

[Переход на Главную страницу](../README.md)
<hr><hr>

# Разработка приложения на основе языка Swift.
## Урок 9 и 10: Анимация
### Описание
- Анимации
    - Базовые анимации
    - Анимации с задержкой
    - Completion
    - Options
    - Пружинная анимация
    - Transition
    - CALayer
    - CABasicAnimation
    - CAKeyframeAnimation
    - CATransition
    - fillMode
    - CAAnimationGroup
    - UIViewPropertyAnimator
    - UITouch
- SwiftUI
    - @State
    - @ObservedObject
    - @Binding
    - Другие обёртки
    - Навигация между экранами
    - NavigationStack

<br>
<hr><hr>

## Задание
### 1. Кнопка в navigationBar

На экране с друзьями в navigationBar добавить кнопку. По клику на эту кнопку будем переходить в профиль.

На экране с друзьями (или беседами) в `navigationBar`:
- Добавьте кнопку.
- По нажатию должен происходить переход к **экрану профиля**.

##
### 2. Экран профиля

Реализовать экран профиля. На нем должно содержаться имя пользователя и фото.

Создайте экран профиля, где должны отображаться:
- Имя пользователя,
- Фото пользователя (аватарка).

Рекомендуемые источники данных:
- [`account.getProfileInfo`](https://dev.vk.com/method/account.getProfileInfo)
- [`users.get`](https://dev.vk.com/method/users.get)

##
### 3. Анимация перехода

Реализуйте **свою анимацию перехода** от `UITabBarController` к экрану пользователя.

##
### 4. SwiftUI проект (Проект 3)

Создайте **новый проект**, где интерфейс реализован с помощью **SwiftUI**.

##
### 5. Экран с новостями (SwiftUI)

Необходимо реализовать два экрана. На первом только текст или кнопка или ссылка. По клику на текст/кнопку/ссылку необходимо перейти на следующий экран. На следующем экране должна отображаться таблица (после загрузки данных из сети), в которой содержатся новости. В ячейке должно быть название новости и дата публикации. Внешний вид на ваше усмотрение.

- Экран 1: текст / кнопка / ссылка.
- По нажатию — переход ко второму экрану.
- Экран 2: таблица с загруженными новостями из сети.

В таблице:
- Заголовок новости,
- Дата публикации.

Для получения новостей изучите api
- Документация API для новостей:  
  [https://docs.kudago.com/api/#page:новости,header:новости-список-новостей](https://docs.kudago.com/api/#page:%D0%BD%D0%BE%D0%B2%D0%BE%D1%81%D1%82%D0%B8,header:%D0%BD%D0%BE%D0%B2%D0%BE%D1%81%D1%82%D0%B8-%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%BD%D0%BE%D0%B2%D0%BE%D1%81%D1%82%D0%B5%D0%B9)

##
## Ожидаемый результат

| № | Описание                                                         | Дополнение                                                                                                |
|--:|------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| 1 | Добавлена кнопка в `navigationBar`.                              | -                                                                                                         |
| 2 | Реализован экран профиля с именем и фото пользователя.           | Возможные адреса: https://dev.vk.com/method/account.getProfileInfo или https://dev.vk.com/method/users.ge |
| 3 | Собственная анимация перехода от `UITabBarController` к профилю. | Реализована своя анимация перехода от UITabBarController к экрану пользователя                            |
| 4 | Создан отдельный проект с интерфейсом на **SwiftUI**.            | У студента должен быть создан новый проект, где interface: SwiftUI.                                       |
| 5 | Реализованы два экрана, второй отображает новости из API.        | Дизайн на усмотрение студента                                                                             |

##



<br>
<hr><hr>

## Решение задания
# Инструкция по выполнению задания
##
## Краткое содержание урока

В уроке рассматривается использование анимаций в приложениях на Swift. 
Охвачены темы работы с `UIView.animate`, `CALayer`, `CABasicAnimation`, `CAKeyframeAnimation`, `CATransition`, 
а также создание анимаций в SwiftUI. Урок подготавливает к реализации плавных интерфейсных переходов, 
реакций на жесты и с пользовательской анимацией.

##
## Задание и реализация
### 1. Кнопка в navigationBar

**Задача:**  
На экране с друзьями (или беседами) добавить кнопку в `navigationBar`, при нажатии которой происходит переход к **экрану профиля**.

**Инструкция:**

1. Перейти в контроллер с друзьями.
2. В `viewDidLoad` добавить кнопку:
```swift
navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(openProfile))
```
3. Реализовать метод перехода:
```swift
@objc func openProfile() {
    let profileVC = ProfileViewController()
    navigationController?.pushViewController(profileVC, animated: true)
}
```

##
### 2. Экран профиля

**Задача:**  
Создать экран профиля с именем пользователя и фото (аватаркой). Используются API:

- `https://dev.vk.com/method/account.getProfileInfo`
- `https://dev.vk.com/method/users.get`

**Инструкция:**

1. Создать новый `UIViewController`:
```swift
class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        // Имя
        let nameLabel = UILabel()
        nameLabel.text = "Имя пользователя"
        nameLabel.textAlignment = .center
        // Аватар
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFit

        // Добавьте constraints по аналогии
    }
}
```

2. Получить данные пользователя с VK API через `URLSession`.

##
### 3. Анимация перехода от UITabBarController

**Задача:**  
Реализовать собственную анимацию при переходе от `UITabBarController` к экрану профиля.

**Инструкция:**

1. Использовать `UIView.transition`:
```swift
let transition = CATransition()
transition.duration = 0.5
transition.type = .fade
navigationController?.view.layer.add(transition, forKey: nil)
navigationController?.pushViewController(profileVC, animated: false)
```

2. Либо применить `UIView.animate`:
```swift
UIView.animate(withDuration: 0.5) {
    self.view.alpha = 0
} completion: { _ in
    self.navigationController?.pushViewController(profileVC, animated: false)
}
```

##
### 4. SwiftUI проект (Проект 3)

**Задача:**  
Создать новый проект с интерфейсом на **SwiftUI**.

**Инструкция:**

1. В Xcode выбрать: File > New > Project.
2. Выбрать Interface: **SwiftUI**.
3. Структура:
```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Перейти к новостям", destination: NewsListView())
        }
    }
}
```

##
### 5. Экран с новостями (SwiftUI)

**Задача:**  
Реализовать два экрана:
- Первый экран содержит кнопку/ссылку.
- Второй экран отображает **список новостей**, загруженных из сети.

**Инструкция:**

1. Первый экран:
```swift
NavigationLink("Открыть новости", destination: NewsListView())
```

2. Второй экран:
```swift
struct NewsListView: View {
    @State var news: [News] = []

    var body: some View {
        List(news) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                Text(item.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear(perform: loadNews)
    }

    func loadNews() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let result = try? JSONDecoder().decode([News].self, from: data) {
                    DispatchQueue.main.async {
                        self.news = result
                    }
                }
            }
        }.resume()
    }
}
```

3. Модель `News`:
```swift
struct News: Identifiable, Codable {
    var id: Int
    var title: String
    var publication_date: String

    var date: String {
        let date = Date(timeIntervalSince1970: TimeInterval(publication_date) ?? 0)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
```

##
## Результат

| № | Описание                                                         | Дополнение                       |
|--:|------------------------------------------------------------------|----------------------------------|
| 1 | Добавлена кнопка в `navigationBar`.                              | -                                |
| 2 | Реализован экран профиля с именем и фото пользователя.           | Через VK API                     |
| 3 | Собственная анимация перехода от `UITabBarController` к профилю. | Реализована вручную              |
| 4 | Создан отдельный проект с интерфейсом на **SwiftUI**.            | Интерфейс построен через SwiftUI |
| 5 | Два экрана: переход и список новостей.                           | Новости загружаются из сети      |


##
**Примечание**: Проект разделён на два модуля UIKit-модуль и SwiftUI-модуль, реализующих соответствующие части по инструкции.

### 1. UIKit-модуль - `UIKitAnimationApp`

**Назначение:**
Реализует переход между экранами с анимацией, используя UIKit.

**Особенности:**

* Экран списка друзей (`FriendsViewController`)
* Переход на экран профиля (`ProfileViewController`)
* Используются `UIView.animate(...)` для анимации элементов
* Применяются `UIViewController`, `UIButton`, `UIImageView`, `UILabel`

##

### 2. SwiftUI-модуль - `SwiftUIAnimationApp`

**Назначение:** 
SwiftUI - приложение с анимацией загрузки и отображением новостей. Демонстрирует анимацию загрузки новостей и отображение списка новостей.

**Особенности:**

* Используются `@State`, `withAnimation`, `List`
* Эффект плавной загрузки (`ProgressView`)
* Отображение новостей после искусственной задержки


<br><br>

[Переход на Главную страницу](../README.md)
<hr><hr>