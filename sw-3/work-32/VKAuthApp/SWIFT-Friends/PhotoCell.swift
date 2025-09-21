import UIKit

final class PhotoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    private var imageTask: URLSessionDataTask?
    private var currentURL: URL?

    private static let placeholderName = "photoPlaceholder"
    private static let cache = NSCache<NSURL, UIImage>()

    override func awakeFromNib() {
        super.awakeFromNib()
        configureImageViewAppearance()
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageTask?.cancel()
        imageTask = nil
        currentURL = nil

        titleLabel?.text = nil
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let iv = imageView {
            iv.layer.cornerRadius = 8
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFill
        }
    }

    func configure(with photo: Photo) {
        titleLabel?.text = "Photo id: \(photo.id), sizes: \(photo.sizes?.count ?? 0)"
        imageView?.image = UIImage(named: Self.placeholderName)

        guard let url = bestURL(from: photo.sizes) else { return }
        loadImage(from: url)
    }

    // MARK: Helpers

    private func configureImageViewAppearance() {
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
    }

    /// Выбираем картинку из массива sizes.
    private func bestURL(from sizes: [PhotoSize]?) -> URL? {
        guard let sizes, !sizes.isEmpty else { return nil }

        // Выбрать по максимальной площади (width*height)
        if let bestByArea = sizes
        .compactMap({ size -> (PhotoSize, Int)? in
            if let w = size.width, let h = size.height, let url = URL(string: size.url) {
                return (size, w * h)
            }
            return nil
        })
        .max(by: { $0.1 < $1.1 })?
        .0.url,
        let url = URL(string: bestByArea) {
            return url
        }

        // Фоллбек: приоритет по типу (w > z > y > x > m > s)
        let rank: [String: Int] = ["w": 6, "z": 5, "y": 4, "x": 3, "m": 2, "s": 1]
        let bestByType = sizes.sorted {
            (rank[$0.type] ?? 0) > (rank[$1.type] ?? 0)
        }.first

        if let candidate = bestByType, let url = URL(string: candidate.url) {
            return url
        }
        return nil
    }

    private func loadImage(from url: URL) {
        imageTask?.cancel()
        currentURL = url

        if let cached = Self.cache.object(forKey: url as NSURL) {
            self.imageView?.image = cached
            return
        }

        imageTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let self else { return }
            defer { self.imageTask = nil }

            guard self.currentURL == url else { return }

            if let data, let image = UIImage(data: data) {
                Self.cache.setObject(image, forKey: url as NSURL)
                DispatchQueue.main.async {
                    guard self.currentURL == url else { return }
                    self.imageView?.image = image
                }
            }
        }
        imageTask?.resume()
    }
}
