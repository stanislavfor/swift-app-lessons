import UIKit

struct LightTheme: CustomTheme {
    var backgroundColor: UIColor {
        return .white
    }

    var textColor: UIColor {
        return .black
    }

    var accentColor: UIColor {
        return UIColor.systemBlue
    }

    var secondaryTextColor: UIColor {
        return UIColor.darkGray
    }

    var cellBackgroundColor: UIColor {
        return UIColor(white: 0.95, alpha: 1)
    }

    var navigationBarStyle: UIBarStyle {
        return .default
    }

    var navigationBarTintColor: UIColor {
        return .white
    }
}
