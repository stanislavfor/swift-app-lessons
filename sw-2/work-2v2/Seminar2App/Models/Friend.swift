import Foundation

/// Модель данных друга
struct Friend: Identifiable {
    let id = UUID()         // уникальный идентификатор
    let name: String        // имя друга
    let isOnline: Bool      // статус онлайн/офлайн

}
