import SwiftUI

/// Экран "Groups" – список групп
struct GroupsView: View {
    @StateObject private var viewModel = GroupsViewModel()  // ViewModel для списка групп

    var body: some View {
        List(viewModel.groups) { group in
            NavigationLink(destination: ChatView(viewModel: ChatViewModel(group: group))) {
                GroupRowView(group: group)
            }
        }
        .navigationTitle("Groups")
    }
}
