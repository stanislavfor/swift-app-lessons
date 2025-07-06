
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Открыть новости", destination: NewsListView())
                .padding()
        }
    }
}
