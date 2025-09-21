import Foundation

/// ViewModel для экрана "Groups"
class GroupsViewModel: ObservableObject {
    /// Список групп (пять групп-заглушек)
    @Published var groups: [Group] = []

    init() {
        // Заполнение списка 5 группами (статические данные)
        groups = [
            Group(name: "Ценители Музыки", membersCount: 120),
            Group(name: "Путешественники", membersCount: 80),
            Group(name: "Спортивные Фанаты", membersCount: 200),
            Group(name: "Любители кино", membersCount: 57),
            Group(name: "Гурманы", membersCount: 34)
        ]
    }
}
