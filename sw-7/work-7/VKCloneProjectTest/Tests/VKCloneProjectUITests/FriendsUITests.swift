import XCTest

final class FriendsUITests: XCTestCase {
    func testFriendsListLoads() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.tables["FriendsTableView"].exists)
    }
}