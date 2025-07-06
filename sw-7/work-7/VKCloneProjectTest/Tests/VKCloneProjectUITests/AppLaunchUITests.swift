import XCTest

final class AppLaunchUITests: XCTestCase {
    func testAppLaunchesToMainScreen() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.navigationBars["Друзья"].exists || app.navigationBars["Friends"].exists)
    }
}