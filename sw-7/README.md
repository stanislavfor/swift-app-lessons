![](../assets/swift-source-file.jpg)

[Переход на Главную страницу](../README.md)
<hr><hr>

[Переход в Проект с тестами](work-7/VKCloneProjectTest/README.md)

# Разработка приложения на основе языка Swift.
## Урок 13 и 14: Архитектуры и тестирование
### Описание
- Какие бывают архитектурные паттерны
- Что такое SOLID, KISS, DRY и YAGNI
- Зачем нужен SwiftLint
- Несколько правил хорошего кода
- Что такое unit и ui-тесты

<br>
<hr><hr>

## Задание
### 1. Архитектурный паттерн

Выбрать архитектурный паттерн. Переписать свой проект с друзьями, группами и фото с использованием этого паттерна.

- Выбрать архитектурный паттерн, например, MVC, MVVM, MVP и т.д.
- Переписать свой проект со следующими сущностями:
    - друзья,
    - группы,
    - фотографии,
      с использованием выбранного паттерна.

##
### 2. Рефакторинг

Провести рефакторинг кода. Постарайтесь сделать так, чтобы в вашем коде соблюдались основные принципы. 
Также проверьте, что у вас используются понятные названия, название классов с большой буквы, 
функций с маленькой и так далее.

- Провести рефакторинг кода.
- Проверить соблюдение принципов:
    - читаемость,
    - простота,
    - переиспользуемость.
- Проверить в:
    - корректном написании имён классов (с большой буквы),
    - имён функций (с маленькой буквы),
    - понятных и логичных названиях переменных и методов.

##
### 3. SwiftLint

Подключить SwiftLint к проекту. Избавиться от ошибок и предупреждений.

- Подключить **SwiftLint** к проекту.
- Избавиться от всех ошибок и предупреждений, выявленных линтером.

##
### 4. Покрытие тестами

Покрыть свой код unit и ui-тестами.

- Написать:
    - **unit-тесты** (юнит-тесты для отдельных компонентов логики),
    - **ui-тесты** (проверка пользовательского интерфейса и навигации).

##
<br>
<hr><hr>

## Решение задания

### Cтруктура итогового проекта

Каждый модуль - это изолированная часть приложения, взаимодействующая с остальными по назначению, данные, сеть, интерфейс.

- iOS App (VK Clone) - основной контейнер, объединяющий все модули
- Friends Module - отображение и управление друзьями, использует CoreData
- Groups Module - работа с группами, использует сетевые запросы
- Photos Module - просмотр и загрузка фото, через сеть
- Themes - поддержка переключения между светлой, тёмной и кастомной темами
- Networking - модуль для работы с API
- CoreData - хранение локальных данных, например, профили друзей
- SwiftUI Components - визуальные компоненты, оформленные в SwiftUI, например, карточки, списки


##
## Рефакторинг кода
### Что требуется

- Проверить соответствие стилю именования:
  - Классы, структуры, перечисления - с большой буквы: `FriendModel`, `GroupViewController`
  - Методы, переменные - с маленькой буквы: `loadPhotos()`, `friendsTableView`
- Удалить неиспользуемый код и комментарии.
- Проверить соблюдение принципов SOLID:
  - Разделение ответственности, например, ViewController не должен выполнять сетевые запросы напрямую
  - Явное разграничение моделей/вью/логики

### Какие нужны изменения

1. ViewController:
  - Разнести логику по слоям MVC или MVVM.
  - Вынести загрузку данных из `ViewController` в отдельные `ViewModel` или сервисы.
2. Model:
  - Проверить, что модели не содержат логики отображения.
3. TableView/CollectionView:
  - Сделать кастомные ячейки максимально легкими.
  - Избавиться от логики внутри ячеек, если есть.

##
## Подключение SwiftLint
### Установка

1. Установить SwiftLint через Homebrew:

   ```bash
   brew install swiftlint
   ```

2. В Xcode:

  - Добавить Run Script в Build Phases:

    ```bash
    if which swiftlint > /dev/null; then
        swiftlint
    else
        echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
    fi
    ```

3. Создать `.swiftlint.yml` в корне проекта:

```yaml
disabled_rules: # отключённые проверки
  - line_length
  - force_cast
  - force_unwrapping

opt_in_rules: # включённые проверки
  - empty_enum_arguments
  - explicit_init

included:
  - Sources

excluded:
  - Pods
  - Carthage
  - .build

reporter: xcode
```

### Исправить все предупреждения и ошибки:

- Найти в проекте и исправить:
  - длинные строки,
  - неправильные отступы,
  - force unwrap/force cast,
  - именование.

##
## Покрытие тестами (Unit и UI)
### Unit-тесты

1. Создать модуль `VKCloneProjectTests`
2. Примеры тестов:

```swift
import XCTest
@testable import VKCloneProject

final class FriendModelTests: XCTestCase {
    func testFriendInitialization() {
        let friend = FriendModel(id: UUID(), name: "Ivan", avatar: "avatar1", isFavorite: true)
        XCTAssertEqual(friend.name, "Ivan")
        XCTAssertTrue(friend.isFavorite)
    }
}
```

### UI-тесты

1. Создать модуль `VKCloneProjectUITests`
2. Пример теста:

```swift
import XCTest

final class VKCloneProjectUITests: XCTestCase {

    func testFriendListIsDisplayed() {
        let app = XCUIApplication()
        app.launch()

        let table = app.tables.firstMatch
        XCTAssertTrue(table.exists)
    }
}
```
<br><br>

[Переход в Проект с тестами](work-7/VKCloneProjectTest/README.md)

<br><br>

[Переход на Главную страницу](../README.md)
<hr><hr>