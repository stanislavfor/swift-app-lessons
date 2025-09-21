
import UIKit

final class FriendCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: Private state

    /// Текущая активная задача загрузки аватара
    private var avatarTask: URLSessionDataTask?

    /// URL загружаемого изображение
    private var currentAvatarURL: URL?

    // MARK: Static

    /// Имя placeholder-изображения в Assets.xcassets
    private static let placeholderName = "friendPlaceholder"

    /// Кеш картинок по URL
    private static let cache = NSCache<NSURL, UIImage>()

    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        configureImageViewAppearance()
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // Отменяем загрузку предыдущего аватара
        avatarTask?.cancel()
        avatarTask = nil
        currentAvatarURL = nil

        // Сбрасываем контент
        titleLabel?.text = nil
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Делаем аватар круглым, если известны реальные размеры imageView
        if let iv = imageView {
            iv.layer.cornerRadius = iv.bounds.height / 2
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFill
        }
    }

    // MARK: Public API

    /// Конфигурируем ячейку данными
    func configure(with friend: Friend) {
        let first = friend.first_name ?? ""
        let last  = friend.last_name ?? ""
        titleLabel?.text = "\(first) \(last) — id: \(friend.id)"

        // Сначала ставим placeholder
        imageView?.image = UIImage(named: Self.placeholderName)

        // Выбираем более качественное разрешение аватарки
        guard let urlStr = friend.photo_100 ?? friend.photo_50,
        let url = URL(string: urlStr) else {
            // нет аватара, то остаёмся на placeholder
            return
        }

        loadImage(from: url)
    }

    // MARK: Private helpers

    private func configureImageViewAppearance() {
        imageView?.clipsToBounds = true
        imageView?.contentMode = .scaleAspectFill
    }

    /// Загружает изображение по URL с кешированием и защитой от «переклейки»
    private func loadImage(from url: URL) {
        avatarTask?.cancel()
        currentAvatarURL = url

        // Проверяем кеш
        if let cached = Self.cache.object(forKey: url as NSURL) {

            DispatchQueue.main.async { [weak self] in
                guard let self = self, self.currentAvatarURL == url else { return }
                self.imageView?.image = cached
            }
            return
        }

        // Скачиваем
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        avatarTask = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let self = self else { return }
            defer { self.avatarTask = nil }

            guard self.currentAvatarURL == url else { return }

            // Ошибки сети игнорируем — оставляем placeholder
            guard error == nil, let data, let image = UIImage(data: data) else { return }

            // Кеш
            Self.cache.setObject(image, forKey: url as NSURL)

            DispatchQueue.main.async { [weak self] in
                guard let self = self, self.currentAvatarURL == url else { return }
                self.imageView?.image = image
            }
        }

        avatarTask?.resume()
    }
}
