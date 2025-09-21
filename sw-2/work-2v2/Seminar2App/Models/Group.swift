import Foundation

/// Модель данных группы
struct Group: Identifiable {
    let id = UUID()         // уникальный идентификатор
    let name: String        // название группы
    let membersCount: Int   // количество участников в группе

}
