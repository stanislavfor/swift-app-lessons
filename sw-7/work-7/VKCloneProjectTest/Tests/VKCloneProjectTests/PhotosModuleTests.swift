import XCTest
@testable import VKCloneProject

final class PhotosModuleTests: XCTestCase {

    func testPhotoModelInit() {
        let photo = PhotoModel(imageName: "photo1")
        XCTAssertEqual(photo.imageName, "photo1")
    }
}