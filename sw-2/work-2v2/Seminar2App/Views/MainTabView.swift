import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Вкладка Friends
            NavigationView {
                FriendsView()
            }
            .tabItem {
                Image(systemName: "person.2.fill")
                Text("Friends")
            }

            // Вкладка Groups
            NavigationView {
                GroupsView()
            }
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Groups")
            }

            // Вкладка Photos
            // PhotosView в NavigationView для отображения .navigationTitle("Photos")
            NavigationView {
                PhotosView()
            }
            .tabItem {
                Image(systemName: "photo.on.rectangle")
                Text("Photos")
            }
        }
    }
}

// При необходимости: Preview
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
