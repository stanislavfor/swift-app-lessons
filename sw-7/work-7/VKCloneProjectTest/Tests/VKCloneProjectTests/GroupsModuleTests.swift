import XCTest
@testable import VKCloneProject

final class GroupsModuleTests: XCTestCase {

    func testGroupModelInit() {
        let group = GroupModel(id: 1, name: "Developers", imageName: "group1")
        XCTAssertEqual(group.id, 1)
        XCTAssertEqual(group.name, "Developers")
        XCTAssertEqual(group.imageName, "group1")
    }
}