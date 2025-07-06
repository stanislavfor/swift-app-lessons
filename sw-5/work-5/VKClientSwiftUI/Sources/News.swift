
import Foundation

struct News: Identifiable, Codable {
    var id: Int
    var title: String
    var publication_date: Int

    var date: String {
        let date = Date(timeIntervalSince1970: TimeInterval(publication_date))
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
