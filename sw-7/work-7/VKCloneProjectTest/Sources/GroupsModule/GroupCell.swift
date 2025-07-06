import UIKit

class GroupCell: UITableViewCell {

    static let identifier = "GroupCell"

    private let groupImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()

    private let groupNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        return label
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }



    private func setupLayout() {
        contentView.addSubview(groupImageView)
        contentView.addSubview(groupNameLabel)

        NSLayoutConstraint.activate([
            groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupImageView.widthAnchor.constraint(equalToConstant: 50),
            groupImageView.heightAnchor.constraint(equalToConstant: 50),
            groupNameLabel.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 16),
            groupNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            groupNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }



    func configure(with group: GroupModel) {
        groupNameLabel.text = group.name
        groupImageView.image = UIImage(named: group.imageName)
    }
}
