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


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Друзья"
        view.backgroundColor = .systemBackground
        setupTableView()
    }



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



extension FriendsViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let friend = friends[indexPath.row]
            let photosVC = PhotosViewController()
            photosVC.friend = friend
            navigationController?.pushViewController(photosVC, animated: true)
        }
}
