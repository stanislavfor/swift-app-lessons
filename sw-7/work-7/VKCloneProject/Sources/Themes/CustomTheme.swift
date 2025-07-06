import UIKit

protocol CustomTheme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var accentColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
    var cellBackgroundColor: UIColor { get }
    var navigationBarStyle: UIBarStyle { get }
    var navigationBarTintColor: UIColor { get }
}
