import Foundation

enum VKServiceError: Error {
    case badURL
    case noToken
    case http(status: Int)
    case unknown
}

enum VKService {

    // Универсальный GET-запрос к VK API, возвращает JSON-текст
    static func sendRequest(method: String,
    params: [String: String] = [:],
    completion: @escaping (Result<String, Error>) -> Void) {
        guard let token = Storage.token else {
            return completion(.failure(VKServiceError.noToken))
        }

        var components = URLComponents(string: Constants.VK.apiBase + method)
        var query: [URLQueryItem] = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        query.append(URLQueryItem(name: "access_token", value: token))
        query.append(URLQueryItem(name: "v", value: Constants.VK.apiVersion))
        components?.queryItems = query

        guard let url = components?.url else {
            return completion(.failure(VKServiceError.badURL))
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { return completion(.failure(error)) }
            guard let http = response as? HTTPURLResponse else {
                return completion(.failure(VKServiceError.unknown))
            }
            guard (200..<300).contains(http.statusCode) else {
                return completion(.failure(VKServiceError.http(status: http.statusCode)))
            }
            guard let data = data, let text = String(data: data, encoding: .utf8) else {
                return completion(.failure(VKServiceError.unknown))
            }
            completion(.success(text))
        }
        task.resume()
    }

    // MARK: Storage (UserDefaults)

    enum Storage {
        private static let tokenKey = Constants.StorageKey.token
        private static let userIdKey = Constants.StorageKey.userId

        static func save(token: String, userId: String) {
            let ud = UserDefaults.standard
            ud.set(token, forKey: tokenKey)
            ud.set(userId, forKey: userIdKey)
            // ud.synchronize() - не требуется
        }

        static func clear() {
            let ud = UserDefaults.standard
            ud.removeObject(forKey: tokenKey)
            ud.removeObject(forKey: userIdKey)
        }

        static var token: String? { UserDefaults.standard.string(forKey: tokenKey) }
        static var userId: String? { UserDefaults.standard.string(forKey: userIdKey) }
    }
}
