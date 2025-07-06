
import UIKit

class FriendsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Friends"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(openProfile))
    }

    @objc func openProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
