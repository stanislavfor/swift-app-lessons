import Foundation

/// Модель данных фотографии (изображения)
struct Photo: Identifiable {
    let id = UUID()          // уникальный идентификатор
    let imageName: String    // название ресурса изображения в Assets
}
