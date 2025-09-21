import Foundation

struct VKEnvelope<T: Decodable>: Decodable {
    let response: T?
    let error: VKAPIError?
}

struct VKAPIError: Decodable, Error {
    let error_code: Int
    let error_msg: String
}
