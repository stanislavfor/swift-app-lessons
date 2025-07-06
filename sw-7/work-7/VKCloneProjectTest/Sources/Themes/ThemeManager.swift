import Foundation

enum ThemeType: String {
    case light
    case dark
}

final class ThemeManager {
    static let shared = ThemeManager()
    private init() {}
    private let themeKey = "selectedTheme"
    var currentTheme: CustomTheme {
        switch selectedThemeType {
        case .dark:
            return DarkTheme()
        case .light:
            return LightTheme()
        }
    }

    var selectedThemeType: ThemeType {
        get {
            if let storedValue = UserDefaults.standard.string(forKey: themeKey),
               let theme = ThemeType(rawValue: storedValue) {
                return theme
            }
            return .light
        }
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: themeKey)
        }
    }
    func toggleTheme() {
        selectedThemeType = selectedThemeType == .light ? .dark : .light
    }
}
