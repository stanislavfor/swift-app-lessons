import SwiftUI

/// Экран "Friends" – список друзей
struct FriendsView: View {
    @StateObject private var viewModel = FriendsViewModel()  // ViewModel для списка друзей

    var body: some View {
        List(viewModel.friends) { friend in
            // Навигационный линк для перехода на экран переписки с выбранным другом
            NavigationLink(destination: ChatView(viewModel: ChatViewModel(friend: friend))) {
                FriendRowView(friend: friend)
            }
        }
        .navigationTitle("Friends")  // заголовок на навигационной панели
    }
}
