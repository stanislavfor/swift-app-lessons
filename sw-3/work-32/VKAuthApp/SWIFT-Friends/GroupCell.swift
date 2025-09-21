import UIKit

final class GroupCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    private static let placeholderName = "groupPlaceholder"

    override func awakeFromNib() {
        super.awakeFromNib()
        configureImageViewAppearance()
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel?.text = nil
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let iv = imageView {
            iv.layer.cornerRadius = iv.bounds.height / 2
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFill
        }
    }

    func configure(with group: Group) {
        // У модели Group нет URL аватарки, показываем плейсхолдер
        titleLabel?.text = "\(group.name ?? "—") (id: \(group.id))"
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    func configureID(_ id: Int) {
        titleLabel?.text = "Group id: \(id)"
        imageView?.image = UIImage(named: Self.placeholderName)
    }

    private func configureImageViewAppearance() {
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
    }
}
