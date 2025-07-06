[Назад](../../README.md)
# Выполнение тестов в проекте
## Порядок настройки и проведения тестирования
### Структура проекта

Проверить, что структура проекта включает модули `Tests`, `VKCloneProject.xcodeproj`


### 1. Настроить Target'ы

В `VKCloneProject.xcodeproj` должны быть настроены два test target:

- `VKCloneProjectTests` - Unit Tests
- `VKCloneProjectUITests` - UI Tests

Проверить, что у тестовых target:
    - указаны `Host Application` (основное приложение)
    - добавлены соответствующие `.swift` файлы
    - настроен `Info.plist`
Проверить, что включена опция "Enable Testability", в Build Settings → Swift Compiler - Code Generation


### 2. Открыть и выбрать схему

В Xcode:
1. Открыть `VKCloneProject.xcodeproj`
2. В панели сверху выбрать схему `VKCloneProject`
3. Проверить, что указаны оба набора тестов: `VKCloneProjectTests`, `VKCloneProjectUITests`


### 3. Запуск тестов
#### Способ 1. - Запуск тестов через Xcode

- Нажать `⌘U` (Cmd + U) для запуска всех тестов
- Или открыть `Test Navigator (⌘6)` -> выбрать и запустить нужный тест

#### Способ 2. - Запуск тестов через терминал

```bash
    xcodebuild test \
      -project VKCloneProject.xcodeproj \
      -scheme VKCloneProject \
      -sdk iphonesimulator \
      -destination 'platform=iOS Simulator,name=iPhone 15' \
      clean build test
```


#### 4. Проверка результата

- Проверить, что тесты проходят, установлены зеленые галочки
- Если тесты не запускаются:
    - проверить, добавлены ли тестовые классы в `Build Phases -> Compile Sources`
    - проверить `Info.plist` для тестов
    - проверить, что тесты наследуют `XCTestCase`


#### 5. SwiftLint

Также перед тестами можно запустить линтер:

```bash
  swiftlint
```

<hr>

#### Пример файлов с кодом тестов

##### `VKCloneProjectTests.swift`

```swift
import XCTest
@testable import VKCloneProject

final class VKCloneProjectTests: XCTestCase {

    func testExample() throws {
        let friend = FriendModel(id: 1, name: "Test Friend", avatar: "avatar1")
        XCTAssertEqual(friend.name, "Test Friend")
    }
}
```

##### `VKCloneProjectUITests.swift`

```swift
import XCTest

final class VKCloneProjectUITests: XCTestCase {

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["Друзья"].exists)
    }
}
```
[Назад](../../README.md)
<br><br><br><br>
