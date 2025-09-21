import Foundation

/// Отправитель сообщения (кто отправил)
enum Sender {
    case me      // сообщение от текущего пользователя
    case other   // сообщение от собеседника (друга или группы)
}

/// Модель данных сообщения чата
struct Message: Identifiable {
    let id = UUID()       // уникальный идентификатор сообщения
    let text: String      // текст сообщения
    let sender: Sender    // кто отправил сообщение (я или собеседник)
}
