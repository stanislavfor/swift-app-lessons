import Foundation

// Без VKEnvelope/VKAPIError, они объявлены в VKEnvelope.swift
struct FriendsResponse: Decodable {
    let count: Int
    let items: [Friend]
}

struct Friend: Decodable {
    let id: Int
    let first_name: String?
    let last_name: String?
    let domain: String?
    let photo_50: String?
    let photo_100: String?
    let is_closed: Bool?
}
