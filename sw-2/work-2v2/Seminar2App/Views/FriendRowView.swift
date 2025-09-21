import SwiftUI

/// Кастомная ячейка для отображения друга в списке
struct FriendRowView: View {
    let friend: Friend  // модель друга, данные которой будем отображать

    var body: some View {
        HStack {
            // Иконка профиля (SFSymbol)
            Image(systemName: "person.circle.fill")
                .resizable().frame(width: 40, height: 40)
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text(friend.name)
                    .font(.system(size: 18, weight: .medium))
                // Статус онлайн/офлайн
                Text(friend.isOnline ? "В сети" : "Не в сети")
                    .font(.system(size: 14))
                    .foregroundColor(friend.isOnline ? .green : .secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
