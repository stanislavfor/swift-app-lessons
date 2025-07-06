import SwiftUI

struct FriendCardView: View {
    let name: String
    let avatar: String
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
            Text(name)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

struct FriendCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FriendCardView(name: "Алексей Иванов", avatar: "avatar1")
                .previewLayout(.sizeThatFits)
            FriendCardView(name: "Мария Смирнова", avatar: "avatar2")
                .previewLayout(.sizeThatFits)
        }
    }
}
