import UIKit

class PhotosViewController: UIViewController {

    // Свойства

    var friend: FriendModel?  // <- Передаётся извне

    private var photos: [PhotoModel] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 100)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()

    // Жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Название экрана по имени друга, если есть
        title = friend?.name ?? "Фотографии"

        setupCollectionView()
        loadPhotos()
    }

    // Настройка CollectionView

    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

    // Загрузка фотографий

    private func loadPhotos() {
        // Пример: статические изображения можно заменить на friend-зависимые данные.
        photos = [
            PhotoModel(imageName: "photo1"),
            PhotoModel(imageName: "photo2"),
            PhotoModel(imageName: "photo3"),
            PhotoModel(imageName: "photo4"),
            PhotoModel(imageName: "photo5"),
            PhotoModel(imageName: "photo6")
        ]
        collectionView.reloadData()
    }
}

// UICollectionViewDataSource, UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let photo = photos[indexPath.item]
        cell.configure(with: photo)
        return cell
    }
}
