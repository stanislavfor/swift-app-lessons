import Foundation

/// ViewModel для экрана чата (переписки)
class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []   // сообщения в чате
    let chatTitle: String                     // заголовок чата (имя друга или группы)

    /// Инициализатор для чата с конкретным другом
    init(friend: Friend) {
        self.chatTitle = friend.name
        loadSampleMessages(friendName: friend.name, isGroupChat: false)
    }

    /// Инициализатор для чата с конкретной группой
    init(group: Group) {
        self.chatTitle = group.name
        loadSampleMessages(friendName: group.name, isGroupChat: true)
    }

    /// Загрузка сообщений-заглушек для демонстрации
    private func loadSampleMessages(friendName: String, isGroupChat: Bool) {
        // Диалог из нескольких сообщений
        messages = [
            Message(text: "Привет!", sender: .me),
            Message(text: isGroupChat ? "Привет всем!" : "Привет, как дела?", sender: .other),
            Message(text: "Все хорошо, спасибо.", sender: .me),
            Message(text: "Рад слышать!", sender: .other),
            Message(text: "Что нового?", sender: .me),
            Message(text: "Все отлично, скоро увидимся.", sender: .other)
        ]
    }
}
