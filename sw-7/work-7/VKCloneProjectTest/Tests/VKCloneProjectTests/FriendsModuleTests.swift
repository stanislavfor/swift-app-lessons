import XCTest
@testable import VKCloneProject

final class FriendsModuleTests: XCTestCase {

    func testFriendModelInit() {
        let friend = FriendModel(id: 1, name: "Ivan", avatar: "avatar1")
        XCTAssertEqual(friend.id, 1)
        XCTAssertEqual(friend.name, "Ivan")
        XCTAssertEqual(friend.avatar, "avatar1")
    }
}