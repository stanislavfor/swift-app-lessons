
import SwiftUI

struct NewsListView: View {
    @State private var news: [News] = []

    var body: some View {
        List(news) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear(perform: loadNews)
    }

    func loadNews() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let result = try? JSONDecoder().decode([News].self, from: data) {
                    DispatchQueue.main.async {
                        self.news = result
                    }
                }
            }
        }.resume()
    }
}
