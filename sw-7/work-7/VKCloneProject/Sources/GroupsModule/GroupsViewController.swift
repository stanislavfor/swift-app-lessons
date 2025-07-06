import UIKit

class GroupsViewController: UIViewController {

    private var groups: [GroupModel] = [
        GroupModel(name: "iOS Developers", imageName: "group1"),
        GroupModel(name: "SwiftUI Lovers", imageName: "group2"),
        GroupModel(name: "Mobile Design", imageName: "group3")
    ]

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(GroupCell.self, forCellReuseIdentifier: GroupCell.identifier)
        return table
    }()

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Группы"
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

extension GroupsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.identifier, for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.configure(with: group)
        return cell
    }
}

// UITableViewDelegate

extension GroupsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGroup = groups[indexPath.row]

        // Пример: выводим название выбранной группы в консоль
        print("Вы выбрали группу: \(selectedGroup.name)")

        tableView.deselectRow(at: indexPath, animated: true)

        // Можно реализовать переход на экран с деталями группы, если будет создан
        // let detailVC = GroupDetailViewController()
        // detailVC.group = selectedGroup
        // navigationController?.pushViewController(detailVC, animated: true)
    }
}
