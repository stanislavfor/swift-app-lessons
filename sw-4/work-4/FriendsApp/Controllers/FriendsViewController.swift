
import UIKit

class FriendsViewController: UITableViewController {
    var friends: [Friend] = []
    let service = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.getFriends { [weak self] data in
            self?.friends = data
            self?.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.isOnline ? "Онлайн" : "Оффлайн"
        cell.detailTextLabel?.textColor = friend.isOnline ? .green : .gray
        return cell
    }
}
