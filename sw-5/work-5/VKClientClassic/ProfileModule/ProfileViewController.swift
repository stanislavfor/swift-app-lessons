
import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        let nameLabel = UILabel()
        nameLabel.text = "Имя пользователя"
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
