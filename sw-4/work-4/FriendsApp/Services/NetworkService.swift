
import Foundation

class NetworkService {
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        DispatchQueue.global().async {
            let friends = [
                Friend(name: "Алексей", isOnline: true),
                Friend(name: "Ирина", isOnline: false)
            ]
            sleep(1)
            DispatchQueue.main.async {
                completion(friends)
            }
        }
    }
}
