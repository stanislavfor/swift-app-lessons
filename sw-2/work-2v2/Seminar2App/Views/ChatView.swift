import SwiftUI

/// Экран переписки (чат) с другом или группой
struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel  // ViewModel чата, передается при инициализации из FriendsView/GroupsView

    var body: some View {
        VStack {
            // Список сообщений
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.messages) { message in
                        HStack {
                            if message.sender == .other {
                                // Сообщение от собеседника выравнивается влево
                                Text(message.text)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                Spacer()
                            } else {
                                // Личное сообщение выравнивается вправо
                                Spacer()
                                Text(message.text)
                                    .padding(10)
                                    .background(Color.blue.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(viewModel.chatTitle)  // заголовок чата (имя друга или группы)
        .navigationBarTitleDisplayMode(.inline)  // отображать заголовок по центру в навбаре
    }
}
