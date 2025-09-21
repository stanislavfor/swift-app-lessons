import Foundation

/// ViewModel для экрана "Photos"
class PhotosViewModel: ObservableObject {
    /// Массив из 6 фотографий (заглушки на изображения из ресурсов)
    @Published var photos: [Photo] = []

    init() {
        // Наличие этих ресурсов в Assets
        photos = [
            Photo(imageName: "photo1"),
            Photo(imageName: "photo2"),
            Photo(imageName: "photo3"),
            Photo(imageName: "photo4"),
            Photo(imageName: "photo5"),
            Photo(imageName: "photo6")
        ]
    }
}
