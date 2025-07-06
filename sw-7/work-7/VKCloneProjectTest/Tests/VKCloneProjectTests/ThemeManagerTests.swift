import XCTest
@testable import VKCloneProject

final class ThemeManagerTests: XCTestCase {

    func testThemeSwitching() {
        ThemeManager.shared.setTheme(LightTheme())
        XCTAssertTrue(ThemeManager.shared.currentTheme is LightTheme)

        ThemeManager.shared.setTheme(DarkTheme())
        XCTAssertTrue(ThemeManager.shared.currentTheme is DarkTheme)
    }
}