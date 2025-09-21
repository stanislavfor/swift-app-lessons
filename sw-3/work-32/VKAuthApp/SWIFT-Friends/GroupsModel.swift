import Foundation

// extended=0 -> items: [Int]; extended=1 -> items: [Group]
// Если extended=0 → items: [Int]
// Если extended=1 → items: [Group]

struct GroupsResponseIDs: Decodable {
    let count: Int
    let items: [Int]
}

struct GroupsResponseExtended: Decodable {
    let count: Int
    let items: [Group]
}

struct Group: Decodable {
    let id: Int
    let name: String?
    let screen_name: String?
    let is_closed: Int?
    let type: String? // group/page/event
}
