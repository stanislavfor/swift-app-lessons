import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
    }
}
