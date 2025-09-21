import UIKit
import WebKit

final class ViewController: UIViewController, WKNavigationDelegate {
    private var didCompleteAuth = false
    private let oauthState = UUID().uuidString

    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let wv = WKWebView(frame: .zero, configuration: config)
        wv.navigationDelegate = self
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VK Login"
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        loadVKAuth()
    }

    private func loadVKAuth() {
        var comps = URLComponents(string: Constants.VK.oauthURL)!
        comps.queryItems = [
            .init(name: "client_id", value: Constants.VK.clientId),
            .init(name: "display", value: "mobile"),
            .init(name: "redirect_uri", value: Constants.VK.redirectURI),
            .init(name: "scope", value: Constants.VK.scope),
            .init(name: "response_type", value: "token"),
            .init(name: "state", value: oauthState),
            .init(name: "v", value: Constants.VK.apiVersion)
        ]
        guard let url = comps.url else { return }
        webView.load(URLRequest(url: url))
    }

    // MARK: WKNavigationDelegate

    func webView(_ webView: WKWebView,
    decidePolicyFor navigationAction: WKNavigationAction,
    decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            return decisionHandler(.allow)
        }
        if handleOAuthRedirect(url: url) {
            return decisionHandler(.cancel)
        }
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView,
    decidePolicyFor navigationResponse: WKNavigationResponse,
    decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let url = navigationResponse.response.url, handleOAuthRedirect(url: url) {
            return decisionHandler(.cancel)
        }
        decisionHandler(.allow)
    }

    // MARK: Helpers

    private func handleOAuthRedirect(url: URL) -> Bool {
        guard !didCompleteAuth,
        url.host == "oauth.vk.com",
        url.path == "/blank.html" else { return false }

        let params = Self.parseFragment(url.fragment ?? "")
        if let err = params["error"] {
            let message = params["error_description"] ?? err
            presentAlert(title: "VK OAuth Error", message: message)
            return true
        }

        guard let token = params["access_token"],
        let userId = params["user_id"],
        params["state"] == oauthState else {
            // либо не редирект, либо защитный параметр state не совпал
            return false
        }

        // Токен и uid в Storage (UserDefaults)
        VKService.Storage.save(token: token, userId: userId)

        didCompleteAuth = true
        DispatchQueue.main.async { [weak self] in
            self?.performSegue(withIdentifier: Constants.SegueID.showFriends, sender: nil)
        }
        return true
    }

    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // Разбор фрагмента #a=b & c=d
    static func parseFragment(_ fragment: String) -> [String: String] {
        guard !fragment.isEmpty else { return [:] }
        return fragment
        .split(separator: "&")
        .compactMap { pair -> (String, String)? in
            let parts = pair.split(separator: "=", maxSplits: 1).map(String.init)
            guard parts.count == 2 else { return nil }
            let k = parts[0].removingPercentEncoding ?? parts[0]
            let v = parts[1].removingPercentEncoding ?? parts[1]
            return (k, v)
        }
        .reduce(into: [:]) { $0[$1.0] = $1.1 }
    }
}
