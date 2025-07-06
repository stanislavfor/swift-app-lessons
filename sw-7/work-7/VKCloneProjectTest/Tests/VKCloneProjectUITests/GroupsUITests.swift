import XCTest

final class GroupsUITests: XCTestCase {
    func testGroupsListLoads() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.tables["GroupsTableView"].exists)
    }
}