import SwiftUI

/// Экран "Photos" – отображение 6 фотографий
struct PhotosView: View {
    @StateObject private var viewModel = PhotosViewModel()  // ViewModel для фото

    // Определяем три колонки для сетки изображений
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.photos) { photo in
                    Image(photo.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipped()
                }
            }
            .padding()
        }
        .navigationTitle("Photos")
    }
}
