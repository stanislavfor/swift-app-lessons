[Переход на Главную страницу](../../README.md)
##
# Задание
## Работа с приложением в сети (по пунктам)
##
### 1. WKWebView - авторизация VK

Необходимо очистить ViewController и добавить на него WKWebView(WKWebView).
Для этого необходимо вверху импортировать WebKit,
затем добавить WKWebView в качестве subview и сделать контроллер делегатом для webView (для этого
ViewController должен соответствовать WKNavigationDelegate).

- Очистить `ViewController.swift`.
- Импортировать `WebKit`.
- Добавить `WKWebView` в качестве `subview`.
- Сделать контроллер делегатом `WKNavigationDelegate`.
- В `viewDidLoad()` настроить загрузку URL:

```swift
webView.load(URLRequest(url: url))
```
Вариант настройки:

```swift
private lazy var webView: wkWebView = {
    let webView = WKWebView() 
    webView.navigationDelegate = self 
    return webView
}()
```


- Затем необходимо начать загрузку, например, во viewDidLoad().
  Для этого вызывается webView.load и передается URLRequest.
  Подробнее о запросе, который необходимо отправить можно прочитать в публикации 'oauth-parameters'

Подробнее о параметрах запроса:
https://dev.vk.com/api/oauth-parameters
Пример использования `decidePolicyFor`:

```swift
func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: 
WKNavigationResponse, decisionHandler: @escaping 
(WKNavigationResponsePolicy) -> Void) {
    // Обработка ответа авторизации
}
```
- Также предварительно необходимо “Создать приложение”.
  Сделать это можно кликнув на “Создать приложение” здесь: на https://dev.vk.com/, в конкретном случае это приложение, созданное по адресу:
  https://vk.com/app54160785
- Затем необходимо реализовать метод func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
  WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void).

Пример:
```swift
func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
WKNavigationResponse, decisionHandler: @escaping
(WKNavigationResponsePolicy) -> Void) {
    guard let url = navigationResponse.response.url, url.path ==
"/blank.html", let fragment = url.fragment else {
        decisionHandler(.allow)
        return
    }
    let params = fragment
        .components(separatedBy: "&")
        .map { $0.components(separatedBy: "=") }
        .reduce([String: String]()) { result, param in
            var dict = result
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
    }
    let token = params["access_token"]
    let userID = params["user_id"]
    print(token)
    print(userID)
    decisionHandler(.cancel)
    webView.removeFromSuperview()
}
```
> Token и userID понадобятся для дальнейших запросов


Документация WebKit: https://developer.apple.com/documentation/webkit/wkwebview



##
### 2. Экран списка друзей

На следующем контроллере планируется отображение списка друзей.
Подумайте и решите, как удобнее: открывать окно авторизации на ViewController
и затем переходить к списку друзей или открывать авторизацию на экране списка друзей.
Реализуйте свое решение.

- После успешной авторизации должен быть переход к новому контроллеру.
- Реализовать один из подходов:
    - Авторизация на первом экране и переход к списку друзей.
    - Авторизация на экране списка друзей.
- Реализовать выбранное поведение.

##
### 3. Получение списка друзей

Получать список друзей. Для этого необходимо изучить документацию, а затем выбрать правильный метод.
Результат нужно выводить в консоль. Отображать список ненужно.
Место, где можно искать метод: https://dev.vk.com/method/friends.
Запрос должен отправляться только после перехода к экрану списка друзей

- Изучить метод `friends.get`: https://dev.vk.com/method/friends
- При открытии экрана списка друзей должен отправляться запрос.
- Выводить результат в консоль.

##
### 4. Получение списка групп

Получать список групп. Для этого необходимо изучить документацию, а затем выбрать правильный метод.
Результат нужно выводить в консоль. Отображать список ненужно.
Место, где можно искать метод: https://dev.vk.com/method/groups.
Запрос должен отправляться только после перехода к экрану списка групп

- Изучить метод `groups.get`: https://dev.vk.com/method/groups
- При открытии экрана списка групп должен отправляться запрос.
- Выводить результат в консоль.

##
### 5. Получение фотографий

Получать фотографии со страницы пользователя.
Для этого необходимо изучить документацию, а затем выбрать правильный метод.
Результат нужно выводить в консоль. Отображать фотографии не нужно. Место, где можно искать метод:
https://dev.vk.com/method/photos.
Запрос должен отправляться только после перехода к экрану фотографий

- Изучить метод `photos.getAll`: https://dev.vk.com/method/photos
- При открытии экрана списка фотографий должен отправляться запрос.
- Выводить результат в консоль.

##
### 6. Ожидаемый результат

| № | Описание                                                                                                                         | Метод                                                        |
|---|----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| 1 | На экране отображается `WKWebView`.<br> Авторизация работает и можно зарегистрироваться.                                         | -   -    -                                                  |
| 2 | После авторизации реализован переход к следующему экрану.<br> Студент реализовал свое решение.                                   | -   -    -                                                 |
| 3 | При открытии экрана друзей - запрос и вывод в консоль.<br> Запрос должен отправляться только после перехода к списку друзей.     | Метод: например,<br> https://dev.vk.com/method/friends.get   |
| 4 | При открытии экрана групп - запрос и вывод в консоль.<br> Запрос должен отправляться только после перехода к списку групп.       | Метод: например,<br> https://dev.vk.com/method/groups        |
| 5 | При открытии экрана фотографий - запрос и вывод в консоль.<br> Запрос должен отправляться только после перехода к списку фотографий. | Метод: например,<br> https://dev.vk.com/method/photos.getAll |

#
##
# Домашняя работа
## Решение

Проект представляет собой клиентское приложение для авторизации во ВКонтакте<br>
и получения данных пользователя через VK API.<br> 
Архитектура построена по шаблону MVC с использованием UIKit, Storyboard и UIViewController для интерфейса.

- Авторизация проходит -> token/user_id сохраняются.
- Переход на "Друзья": печатается декодированный список, первые 5 с именами.
- Переход на "Группы": extended=1 - печатаются названия групп, первые 5.
- Переход на "Фотографии": печатается count, id первой фотки, типы sizes, плюс 5 строк по фото.
- VK-ошибки (например, нет прав) выводятся как `VK error <code>: <msg>`.
- Ошибки декодирования - в консоль как `Decode error: ...`.

### 1. Экран авторизации `ViewController.swift`

* Использован `WKWebView` для открытия OAuth-авторизации ВКонтакте.
* При успешной авторизации перехватывается редирект на `blank.html`, из URL извлекаются `access_token` и `user_id`.
* Данные сохраняются в `UserDefaults` через вспомогательный сервис `VKService.Storage`.
* После авторизации выполняется переход по segue `showFriends` на экран списка друзей.

### 2. Сервисный слой `VKService.swift`, `NetworkService.swift`

* `VKService` отвечает за формирование и отправку HTTP-запросов к API ВКонтакте.
* `NetworkService.getDecodable(...)` добавлен как универсальный метод для отправки запросов и декодирования JSON в модели через `Codable`.
* Для всех методов используется обёртка `VKEnvelope<T>` (response/error), соответствующая структуре ответов API VK.

### 3. Экран списка друзей `FriendsViewController.swift`

* После открытия экрана выполняется запрос `friends.get` с параметрами `fields=first_name,last_name`.
* Ответ автоматически декодируется в модель `FriendsResponse`.
* В консоль выводится количество друзей и список первых пяти друзей с их именами и id.

### 4. Экран списка групп `GroupsViewController.swift`

* При открытии экрана отправляется запрос `groups.get` с параметром `extended=1`, чтобы получать не только id, но и названия групп.
* Ответ декодируется в модель `GroupsResponseExtended`.
* В консоль выводится количество групп и первые пять названий групп.

### 5. Экран фотографий `PhotosViewController.swift`

* При открытии экрана отправляется запрос `photos.getAll` с параметром `photo_sizes=1`.
* Ответ декодируется в модель `PhotosResponse`.
* В консоль выводится количество фотографий, id первой фотографии и список типов размеров. Также печатаются сведения о первых пяти фотографиях.

### 6. Модели данных

* Созданы отдельные `Codable`-модели для друзей, групп и фотографий (`FriendsModel.swift`, `GroupsModel.swift`, `PhotosModel.swift`).
* Используется общий контейнер `VKEnvelope<T>` и модель ошибки `VKAPIError`.

### 7. Storyboard и структура переходов

* В проекте используется `Main.storyboard`:
    - Стартовый экран - `ViewController` (авторизация).
    - После авторизации переход к `FriendsViewController`.
    - Из экрана друзей доступны переходы к `GroupsViewController` и `PhotosViewController`.
- `LaunchScreen.storyboard` содержит простой экран с названием приложения.

### 8. Info.plist

* Установлены ключи `UIMainStoryboardFile=Main`, `UILaunchStoryboardName=LaunchScreen`, а также конфигурация `SceneDelegate`.

#
##
# Инструкция
## Интеграция приложения в VK

1. В кабинете VK, в разделе разработчика создать приложение Standalone.
2. Скопировать его ID, например, `1234567`, и вставить в `Constants.VK.clientId`.
3. Проверить, что в `Constants.VK.scope` есть все нужные права под имеющиеся в приложении экраны:
    - `friends` - для `friends.get`
    - `groups` - для `groups.get`
    - `photos` - для `photos.get*`
    - `offline` (опционально), чтобы токен жил дольше сессии
4. Оставить `redirectURI = https://oauth.vk.com/blank.html` для implicit flow.
5. Запустить проект. На экране авторизации войти в VK, подтвердить права.
6. Успешный редирект сохранит `access_token` и `user_id`, экраны начнут делать запросы.

> Примечание: если при вызовах VK-методов вернутся «нет прав», проверить,<br> совпадает ли запрошенный scope со списком фактически разрешённых в своём токене,<br> перелогиться после изменения `scope`.


##
## Проверка корректной работы приложения

Проверить в:
- `ViewController.handleOAuthRedirect(url:)` - переход на Friends после логина.
- `VKService.sendRequest` - если `token` отсутствует, вернёт `.failure(.noToken)`; если HTTP-статус не 2xx — `.http(status:)`.
- Экраны `FriendsViewController`/`GroupsViewController`/`PhotosViewController` - делают вызовы и печатают в консоль информацию или могут показывать в UI (опционно).


##
## Место хранения токен

Токены сохраняют в файл `SWIFT-Friends/VKService.swift` в `VKService.Storage`.<br>
После успешной авторизации сохраняется или читается `access_token` и `user_id` в `UserDefaults`:
- `save(token:userId:)` вызывается из `ViewController.handleOAuthRedirect(url:)`
- `token`/`userId` читаются перед каждым запросом

Данные приходят автоматически после логина.

**Требуется**:
1. ID приложения VK (`client_id`) - числовой идентификатор приложения из кабинета VK, тип “Standalone” подходит для такого OAuth через WebView.
2. Scopes (права) - список прав, которые используются в методах: `friends,groups,photos`. Опционально можно добавить `offline`, долгоживущий токен.
3. API version (`v`) - уже проставлена и при желании можно обновить на актуальную.
4. Redirect URI - используется стандартный `https://oauth.vk.com/blank.html` для implicit flow. Его менять не требуется.
5. Создать файл Config.xcconfig и добавить его в .gitignore, если не требуется публиковать значения.

**Не требуется**:
1. Не указывать и хранить `client_secret` в проекте. Тут используется Implicit Flow (`response_type=token`) на клиенте. 
2. Не хранить в приложении данные интеграции.
3. Не хранить в публичном доступе любые токены доступа (access_token), рефреш-токены, сервисные ключи, если добавлять серверную интеграцию.
4. Не хранить в публичном доступе дампы логов с токенами.
5. Не хранить в публичном доступе любые приватные URL-схемы и секреты, которые реально дают доступ без участия пользователя, отсутствуют в текущем проекте.


##
## Подключение VK Config

1. Дублировать `Config.example.xcconfig` как `Config.xcconfig` и задать значения:
   - `VK_CLIENT_ID = 1234567`
   - `VK_SCOPE = friends,groups,photos` (опционально добавить `,offline`)
   - `VK_API_VERSION = 5.131`

2. В Xcode: Project -> TARGETS -> Build Settings -> Based on Configuration File
   - Для Debug и Release указать свой `Config.xcconfig`.

3. Собрать проект, где значения будут подставлены в Info.plist:
   - `VKClientId`  <- $(VK_CLIENT_ID)
   - `VKScope`     <- $(VK_SCOPE)
   - `VKApiVersion`<- $(VK_API_VERSION)
4. Если не подключать `Config.xcconfig` в Build Settings, в `Info.plist` останутся строки `$(VK_CLIENT_ID)` и так далее, код это обработает, подставив дефолты: пустой `clientId` и стандартные `scope/apiVersion`. Поэтому для реального запуска авторизации обязательно подключать `.xcconfig` и задать реальный `VK_CLIENT_ID`.
5. Для публичного GitHub:
    - Коммитеть `Config.example.xcconfig` и `README-Config.md`;
    - Не коммитеть собственный реальный `Config.xcconfig`, для чего добавить его в `.gitignore`, чтобы не открывать `clientId` при желании.


##
## Точки ввода прод-значений по файлам

1. Build-конфиги:
    - `VKAuthApp/Config.release.xcconfig` - здесь указывать обычно данные для продакшн:

      ```
      VK_CLIENT_ID = 7654321          // ← заменить на реальный PROD ID
      VK_SCOPE = friends,groups,photos
      VK_API_VERSION = 5.131
      ```
    - `VKAuthApp/Config.debug.xcconfig` - дев/тест:
      ```
      VK_CLIENT_ID = 1234567          // ← собственный DEV/TEST ID
      VK_SCOPE = friends,groups,photos,offline
      VK_API_VERSION = 5.131
      ```
    - (Опционально) `Config.xcconfig` - локальный приватный файл, игнорируется `.gitignore`. 
    - Можно использовать вместо двух отдельных.<br><br>

2. Подстановка в Info.plist:
    - `VKAuthApp/SWIFT-Friends/Info.plist` уже указаны переменные:
      ```
      VKClientId    = $(VK_CLIENT_ID)
      VKScope       = $(VK_SCOPE)
      VKApiVersion  = $(VK_API_VERSION)
      ```
      Xcode подставит значения из выбранного `.xcconfig`.<br><br>

3. Чтение в коде, после сборки данные подтягиваются автоматически:
    - `VKAuthApp/SWIFT-Friends/Constants.swift` код уже читает параметры:
      ```
      static var clientId: String   { info("VKClientId") ?? "" }
      static var apiVersion: String { info("VKApiVersion") ?? "5.131" }
      static var scope: String      { info("VKScope") ?? "friends,groups,photos" }
      ```
    

##
## Подготовка перед публикацией на GitHub

**Необходимо проверить, что**:
- Нет захардкоженных `clientId`/секретов в Swift/Plist
- `Info.plist` использует `$(VK_CLIENT_ID)`/`$(VK_SCOPE)`/`$(VK_API_VERSION)`
- `.gitignore` содержит `Config.xcconfig`
- В репозитории только демо-значения в `Config.debug.xcconfig`/`Config.release.xcconfig` как, например, 1234567/7654321.
- Если пушить в open-source, проверить, чтобы CI не подставлял реальные значения в публикуемый артефакт.


##
## Как запустить приложение

Чтобы открыть проект в Xcode, необходимо дважды кликнуть на файл `SWIFT-Friends.xcodeproj`.<br>
Запуск приложения через SceneDelegate грузится Main.storyboard, который содержит UINavigationController 
с корневым ViewController (экран авторизации).<br> 
AppDelegate и SceneDelegate в iOS 15 в проекте используют значения по умолчанию,<br> 
так как интерфейс задан сторибордом.

### 1. Настройки проекта

- В Xcode открыть Targets -> Signing & Capabilities.
- Если запускать на симуляторе, оставить `Bundle Identifier = com.example.VKAuthApp`.
- Если на реальном устройстве — указать свой `Team` (Apple ID) и уникальный `Bundle Identifier`.

### 2. Запуск

- В верхней панели Xcode выбери симулятор, например, iPhone 14 Pro, или подключённое устройство.
- Нажать кнопку Run или `Cmd + R`.
- Приложение соберётся и запустится на выбранном устройстве.

### 3. Авторизация ВКонтакте

- На первом экране откроется `WKWebView` с формой авторизации ВКонтакте.
- Ввести логин и пароль VK, подтвердить доступ.
- После этого приложение получит `access_token` и `user_id` и перейдёт на экран «Друзья».

### 4. Работа с экранами

- Друзья -> в консоли Xcode печатается список первых 5 друзей.
- Группы -> печатаются названия групп.
- Фотографии -> печатается количество фотографий и сведения о первых 5 фото.


<br><br><br><br>
[Переход на Главную страницу](../../README.md) 
<br><br>

![](../../assets/swift-source-file.jpg)