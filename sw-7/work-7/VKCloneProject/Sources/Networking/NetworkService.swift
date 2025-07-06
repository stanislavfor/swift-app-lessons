import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case unknown(Error)
}

final class NetworkService {

    static let shared = NetworkService()
    private init() {}

    func fetchData<T: Decodable>(
        from endpoint: String,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        let urlString = APIConstants.baseURL + endpoint
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Обработка ошибок
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }
}
