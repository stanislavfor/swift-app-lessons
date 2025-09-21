import Foundation

/// ViewModel для экрана "Friends"
class FriendsViewModel: ObservableObject {
    /// Список друзей (пять друзей-заглушек)
    @Published var friends: [Friend] = []

    init() {
        // Заполнение списка 5 друзьями (статические данные)
        friends = [
            Friend(name: "Иван Иванов", isOnline: true),
            Friend(name: "Пётр Петров", isOnline: false),
            Friend(name: "Мария Сидорова", isOnline: true),
            Friend(name: "Алексей Смирнов", isOnline: false),
            Friend(name: "Ольга Кузнецова", isOnline: true)
        ]
    }
}
