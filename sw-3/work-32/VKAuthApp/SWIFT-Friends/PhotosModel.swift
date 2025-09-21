import Foundation

struct PhotosResponse: Decodable {
    let count: Int
    let items: [Photo]
}

struct Photo: Decodable {
    let id: Int
    let album_id: Int?
    let owner_id: Int?
    let sizes: [PhotoSize]?
    let text: String?
    let date: Int?
}

struct PhotoSize: Decodable {
    let type: String // s, m, x, o, p, q, r, y, z, w
    let url: String
    let width: Int?
    let height: Int?
}
