import Foundation

// Фасад над VKService: можно вызывать его в контроллерах, чтобы не тянуть VKService напрямую.

enum NetworkService {

    static func get(method: String,
    params: [String: String] = [:],
    completion: @escaping (Result<String, Error>) -> Void) {
        VKService.sendRequest(method: method, params: params, completion: completion)
    }

    static func getDecodable<T: Decodable>(method: String,
    params: [String: String] = [:],
    type: T.Type,
    completion: @escaping (Result<T, Error>) -> Void) {
        VKService.sendRequest(method: method, params: params) { result in
            switch result {
            case .success(let text):
                do {
                    let data = Data(text.utf8)
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
