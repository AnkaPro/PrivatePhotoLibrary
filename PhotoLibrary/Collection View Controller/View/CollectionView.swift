
import UIKit

class CollectionView: UIView {
    var addedImages = [UIImage]()
    let label = UILabel()
    lazy var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 15
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(imagesCollectionView)
        self.imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagesCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            imagesCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor),
            imagesCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imagesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        imagesCollectionView.alwaysBounceVertical = true
    }
    
    func addLabel() {
        label.text = "Add new image!"
        label.textColor = .black
        self.imagesCollectionView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.imagesCollectionView.topAnchor, constant: 50)
        ])
    }
    
    func removeLabel() {
        label.removeFromSuperview()
    }
}
