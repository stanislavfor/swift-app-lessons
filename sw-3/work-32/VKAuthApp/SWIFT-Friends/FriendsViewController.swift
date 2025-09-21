import UIKit

final class FriendsViewController: UIViewController {

    @IBAction func showGroups(_ sender: Any) {
        performSegue(withIdentifier: Constants.SegueID.showGroups, sender: nil)
    }

    @IBAction func showPhotos(_ sender: Any) {
        performSegue(withIdentifier: Constants.SegueID.showPhotos, sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Друзья"
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true  // Скрываем кнопку Back
        fetchFriendsDecoded()
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        // Один раз на первый показ:
//        if presentedFetchOnce == false {
//            presentedFetchOnce = true
//            fetchFriendsDecoded()
//        }
//    }
//    private var presentedFetchOnce = false


    private func fetchFriendsDecoded() {
        guard let userId = VKService.Storage.userId else {
            print("[Friends] userId is missing. Did you login?")
            return
        }

        let params: [String: String] = [
            "user_id": userId,
            "fields": "first_name,last_name,photo_50,photo_100",
            "order": "hints"
        ]

        NetworkService.getDecodable(
            method: "friends.get",
            params: params,
            type: VKEnvelope<FriendsResponse>.self
        ) { [weak self] result in
            // Можно переключится на main:
            // DispatchQueue.main.async { ... }
            switch result {
            case .success(let env):
                if let resp = env.response {
                    print("[Friends] count: \(resp.count)")
                    for f in resp.items.prefix(5) {
                        print("- \(f.first_name ?? "") \(f.last_name ?? "") (id: \(f.id))")
                    }
                } else if let err = env.error {
                    print("[Friends] VK error \(err.error_code): \(err.error_msg)")
                } else {
                    print("[Friends] Empty response")
                }
            case .failure(let e):
                print("[Friends] Request failed: \(e)")
            }
        }
    }
}
