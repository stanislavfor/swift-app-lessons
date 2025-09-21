import Foundation

enum Constants {

    enum VK {
        // Читаем значения из Info.plist, с безопасными дефолтами
        static var clientId: String   { info("VKClientId") ?? "" }
        static var apiVersion: String { info("VKApiVersion") ?? "5.131" }
        static var scope: String      { info("VKScope") ?? "friends,groups,photos" }

        static let redirectURI = "https://oauth.vk.com/blank.html"
        static let oauthURL    = "https://oauth.vk.com/authorize"
        static let apiBase     = "https://api.vk.com/method/"

        private static func info(_ key: String) -> String? {
            Bundle.main.object(forInfoDictionaryKey: key) as? String
        }
    }

    enum SegueID {
        static let showFriends = "showFriends"
        static let showGroups  = "showGroups"
        static let showPhotos  = "showPhotos"
    }

    enum StorageKey {
        static let token = "VKAccessToken"
        static let userId = "VKUserId"
    }

    enum StoryboardID {
        static let friendsVC = "FriendsViewController"
        static let groupsVC  = "GroupsViewController"
        static let photosVC  = "PhotosViewController"
    }
}
