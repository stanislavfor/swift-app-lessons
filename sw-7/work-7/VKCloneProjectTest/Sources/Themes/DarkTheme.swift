import UIKit

struct DarkTheme: CustomTheme {
    var backgroundColor: UIColor {
        return UIColor.black
    }

    var textColor: UIColor {
        return UIColor.white
    }

    var accentColor: UIColor {
        return UIColor.systemGreen
    }

    var secondaryTextColor: UIColor {
        return UIColor.lightGray
    }

    var cellBackgroundColor: UIColor {
        return UIColor(white: 0.15, alpha: 1)
    }

    var navigationBarStyle: UIBarStyle {
        return .black
    }

    var navigationBarTintColor: UIColor {
        return .black
    }
}
