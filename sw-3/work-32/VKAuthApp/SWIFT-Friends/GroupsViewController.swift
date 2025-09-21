import UIKit

final class GroupsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Группы"
        view.backgroundColor = .systemBackground
        fetchGroupsDecoded()
    }

    private func fetchGroupsDecoded() {
        guard let userId = VKService.Storage.userId else { return }

        let params: [String: String] = [
            "user_id": userId,
            "extended": "1" // чтобы вернулись объекты групп с именами
        ]

        NetworkService.getDecodable(method: "groups.get",
            params: params,
            type: VKEnvelope<GroupsResponseExtended>.self) { result in
            switch result {
            case .success(let env):
                if let resp = env.response {
                    print("[Groups] count: \(resp.count)")
                    for g in resp.items.prefix(5) {
                        print("- \(g.name ?? "—") (id: \(g.id))")
                    }
                } else if let err = env.error {
                    print("[Groups] VK error \(err.error_code): \(err.error_msg)")
                } else {
                    print("[Groups] Empty response")
                }
            case .failure(let e):
                print("[Groups] Decode error: \(e)")
            }
        }
    }
}
