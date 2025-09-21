import SwiftUI

/// Кастомная ячейка для отображения группы в списке
struct GroupRowView: View {
    let group: Group  // модель группы

    var body: some View {
        HStack {
            // Иконка группы (например, три человека)
            Image(systemName: "person.3.fill")
                .resizable().frame(width: 40, height: 40)
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(group.name)
                    .font(.system(size: 18, weight: .medium))
                // Количество участников группы
                Text("Участников: \(group.membersCount)")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
