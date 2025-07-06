import UIKit

class FriendsViewController: UIViewController {

    private var friends: [FriendModel] = [
        FriendModel(name: "Иван Иванов", avatarName: "avatar1"),
        FriendModel(name: "Анна Смирнова", avatarName: "avatar2"),
        FriendModel(name: "Пётр Сидоров", avatarName: "avatar3")
    ]

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        return table
    }()

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Друзья"
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    // Setup

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// UITableViewDataSource

extension FriendsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        let friend = friends[indexPath.row]
        cell.configure(with: friend)
        return cell
    }
}

// UITableViewDelegate

extension FriendsViewController: UITableViewDelegate {
    // Метод вызывается, когда пользователь нажимает на ячейку таблицы
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Снимаем выделение ячейки (анимация)
            tableView.deselectRow(at: indexPath, animated: true)

            // Получаем модель друга, соответствующую выбранной ячейке
            let friend = friends[indexPath.row]

            // Создаем экран с фотографиями друга
            let photosVC = PhotosViewController()
            photosVC.friend = friend  // Передаём друга в контроллер фотографий

            // Переход к контроллеру с фотографиями
            navigationController?.pushViewController(photosVC, animated: true)
        }
}
