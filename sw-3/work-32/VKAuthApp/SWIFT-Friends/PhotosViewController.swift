import UIKit

final class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фотографии"
        view.backgroundColor = .systemBackground
        fetchPhotosDecoded()
    }

    private func fetchPhotosDecoded() {
        guard let userId = VKService.Storage.userId else {
            print("[Photos] userId is missing. Did you login?")
            return
        }

        var params: [String: String] = [
            "owner_id": userId,
            "photo_sizes": "1" // чтобы гарантированно получить sizes
            // "count": "100", добавить пагинацию и/или
            // "offset": "0"
        ]

        NetworkService.getDecodable(method: "photos.getAll",
            params: params,
            type: VKEnvelope<PhotosResponse>.self) { res in
            switch res {
            case .success(let env):
                if let resp = env.response {
                    print("[Photos] total count: \(resp.count)")
                    if let first = resp.items.first {
                        let types = first.sizes?.map { $0.type }.joined(separator: ",") ?? "-"
                        print("[Photos] first photo id: \(first.id), sizes: \(types)")
                    }
                    for p in resp.items.prefix(5) {
                        let types = p.sizes?.map { $0.type }.joined(separator: ",") ?? "-"
                        print("  • photo \(p.id), sizes: \(types)")
                    }
                } else if let err = env.error {
                    print("[Photos] VK error \(err.error_code): \(err.error_msg)")
                } else {
                    print("[Photos] Empty response")
                }
            case .failure(let e):
                print("[Photos] Decode error: \(e)")
            }
        }
    }
}
