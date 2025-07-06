import SwiftUI

struct PhotoGridView: View {
    let photos: [String]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(photos, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct PhotoGridView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridView(photos: ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6"])
    }
}
