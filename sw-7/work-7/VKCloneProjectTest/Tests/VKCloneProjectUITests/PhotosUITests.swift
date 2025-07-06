import XCTest

final class PhotosUITests: XCTestCase {
    func testPhotosCollectionLoads() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.collectionViews["PhotosCollectionView"].exists)
    }
}