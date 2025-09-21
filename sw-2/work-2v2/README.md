[Переход на Главную страницу](../../README.md)
##
# Задание
## Работа по разработке интерфейса приложения
##
###  Архитектура MVVM (вариант)

Реализация в архитектуре MVVM с разделением проекта на папки Models, ViewModels, Views.

- Model - простые структуры данных (друг, группа, сообщение, фото).
- ViewModel – классы, наследующие `ObservableObject`, содержат данные-заглушки (`@Published`) и простую бизнес-логику.
- View – SwiftUI-представления, отвечают за интерфейс и используют данные из ViewModel.

Проект организован по папкам в соответствии с MVVM:<br>
Models - модели данных: Friend, Group, Photo, Message. Эти структуры описывают данные приложения.<br>
ViewModels – модели представления (по одной на каждый экран): LoginViewModel, FriendsViewModel, GroupsViewModel, PhotosViewModel, ChatViewModel. Они хранят данные-заглушки и реализуют необходимую логику.<br>
Views – SwiftUI-представления экранов: LoginView, MainTabView (экран с табами), FriendsView, GroupsView, PhotosView, ChatView, а также вспомогательные представления для ячеек списка друзей и групп (FriendRowView, GroupRowView). Каждый View связан со своей ViewModel через свойство @StateObject или @ObservedObject.


##  Запуск проекта
1. Открыть проект в Xcode.
2. Убедиться, что в Assets.xcassets добавлены изображения `photo1` … `photo6`.
3. Запустить приложение (`⌘R`).

##  Примечания
- Данные (друзья, группы, фото, сообщения) – заглушки внутри ViewModel, как требовалось в задании.
- Экран чата показывает фиксированные сообщения и не поддерживает отправку (по условиям задания).
- Интерфейс построен по схеме из прилагаемого файла ДЗ (Friends, Groups, Photos).


# Структуру проекта

###  Seminar2App (корень проекта)

Seminar2App.swift - точка входа в приложение (`@main`).

Это Application Entry (App) – точка входа в приложение - Seminar2App, структура App, где определяется начальный экран, экран входа или основной контент в зависимости от состояния входа.
При запуске показывается экран входа LoginView. 
После успешного входа, нажатия кнопки "Войти", будет отображён главный экран с табами MainTabView. 
Логика переключения экранов реализована через состояние @State (флаг isLoggedIn).

В данном проекте нет Main.storyboard и LaunchScreen.storyboard. 
Приложение стартует из Seminar2App.swift как SwiftUI App Lifecycle.



###  Models

Простые структуры данных, без логики. 
Внутри этого же файла можно хранить enum Sender (`.me`, `.other`).

- Friend.swift - модель друга (`id`, `name`, `isOnline`).
- Group.swift - модель группы (`id`, `name`, `membersCount`).
- Photo.swift - модель фото (`id`, `imageName`).
- Message.swift - модель сообщения (`id`, `text`, `sender`).


###  ViewModels

`ObservableObject` с @Published свойствами, заглушки-данные и простая логика

- LoginViewModel.swift - хранит `username`, `password`, метод `performLogin()`.
- FriendsViewModel.swift - массив `friends` (5 друзей).
- GroupsViewModel.swift - массив `groups` (5 групп).
- PhotosViewModel.swift - массив `photos` (6 фото).
- ChatViewModel.swift - массив `messages` для чата, заголовок, конструкторы для друга или группы.



###  Views

SwiftUI UI-компоненты, только отображение, без бизнес-логики

- LoginView.swift - экран авторизации.
- MainTabView.swift - главный контейнер с `TabView` (Friends, Groups, Photos).
- FriendsView.swift - список друзей (с `NavigationLink` → чат).
- GroupsView.swift - список групп (с `NavigationLink` → чат).
- PhotosView.swift - сетка скролл с 6 фото.
- ChatView.swift - экран переписки.
- FriendRowView.swift - кастомная ячейка друга.
- GroupRowView.swift - кастомная ячейка группы.


##  Функционал
- Экран входа с кнопкой "Войти".
- После входа – главный экран с тремя вкладками (`TabView`):
    - Friends – список из 5 друзей как кастомные ячейки.
    - Groups – список из 5 групп как кастомные ячейки.
    - Photos – галерея из 6 фотографий.
- При выборе друга или группы – переход на экран чата, имитирующий переписку.


# Инструкции


## Как подключить `Assets.xcassets` в Xcode

### 1. Добавляем каталог ассетов в проект

1. Открыть Xcode -> Project navigator (левая панель).
2. Найти текущий `Assets.xcassets`.

    * Если требуется заменить его на другой каталог: удалить старый (Delete -> Remove Reference), затем перетащить в проект папку `Assets.xcassets` из Finder.
    * Если требуется объединить: просто перетащить в `Assets.xcassets` и при конфликте имён Xcode предложить объединить или заменить. Разрешить так, чтобы AppIcon.appiconset, AccentColor.colorset и photo1 … photo6.imageset оказались внутри одного `Assets.xcassets`.
3. В диалоге импорта поставить галочку Copy items if needed, чтобы копии легли в проект, и Create folder references не нужно - для `.xcassets` это bundle-пакет, Xcode сам будет его обрабатывать.
4. Проверить, что `Assets.xcassets` виден с "иконкой каталога ассетов".

### 2. Назначаем App Icon из ассетов

1. В Project navigator кликни верхний узел проекта -> выбери TARGETS -> Seminar2App.
2. Вкладка General -> секция App Icons and Launch Images или App Icon в новых версиях):
    * В поле App Icon выбрать AppIcon, имя набора иконок внутри ассетов.   
3. Построить проект (⌘B) - Xcode возьмёт PNG из `AppIcon.appiconset`.

    * Примечание: Для публикации в App Store потребуется полный набор, в т.ч. 1024×1024 Marketing Icon.

### 3. Подключаем Accent Color

* В SwiftUI-шаблонах Xcode AccentColor подхватывается автоматически, если в ассетах есть набор `AccentColor.colorset`.

* Использование в коде:
    * По умолчанию все системные элементы берут `Color.accentColor`.
    * Локально можно переопределить:

      ```
      .tint(.accentColor)        // iOS 15+
      // или для старых версий SwiftUI:
      .accentColor(.accentColor)
      ```
* Если требуется разный цвет для Light/Dark, открыть `AccentColor.colorset` -> добавить Appearances: Any, Dark и указать два цвета.

### 4. Проверяем доступ к картинкам

* В ассетах лежат `photo1 … photo6`. Использовать как:

  ```
  Image("photo1")
  Image("photo2")
  // ...
  Image("photo6")
  ```
* iOS сама выберет нужный `@2x/@3x` в зависимости от устройства.

### 5. Частые ошибки

* Неправильное имя набора иконок - В Target -> General обязательно App Icon = AppIcon, а набор в ассетах должен называться AppIcon.
* Дубликаты ассетов. - Проверить, что в проекте один `Assets.xcassets`, а не несколько разрозненных, которые лучше объединить.
* Не те размеры иконок. - Для разработки мой набор ок, но для Store нужен полный, который можно добавить через Xcode → AppIcon Template или генераторы.
* Screenshots в бандл. - Папка `Screenshots/` для README не должна быть в ассетах; хранить её рядом в проекте, не в `Assets.xcassets`, чтобы не попадала в бандл.

### 6. Быстрая проверка

1. Build & Run (⌘R).
2. На устройстве/симуляторе приложение должно запускаться с "синей иконкой".
3. В UI кнопки/линки подхватят "акцентный синий", если явно не переопределял.
4. Экран Photos показывает `photo1…photo6`.


<br><br><br><br>

[Переход на Главную страницу](../../README.md)
<hr><hr>







