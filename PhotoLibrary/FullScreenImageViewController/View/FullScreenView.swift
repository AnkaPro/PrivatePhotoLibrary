
import UIKit

class FullScreenView: UIView {
    
    let imageView = UIImageView()
    let closeButton = UIButton()
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 23, weight: .bold, scale: .large)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .black
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setSystemImage(name: "xmark", config: largeConfig)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            closeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50)
        ])
    }
}
