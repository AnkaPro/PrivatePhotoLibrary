import UIKit
import Foundation

class ImageViewControllerView: UIView {
    
    var containerView = UIView()
    var bottomView = UIView()
    let imageContainerView = UIView()
    var imageView = UIImageView()
    var nextImage = UIImageView()
    var likeButton = UIButton()
    let commentButton = UIButton()
    let deleteButton = UIButton()
    let leftButton = UIButton()
    let rightButton = UIButton()
    var commentLabel = UILabel()
    var commentTextField = UITextField()
    let mediumConfig = UIImage.SymbolConfiguration(pointSize: 17, weight: .bold, scale: .large)
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 23, weight: .bold, scale: .large)
    let scrollView = SPKeyBoardAvoiding()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupContainerView() {
        self.backgroundColor = .white
        scrollView.alwaysBounceVertical = true
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setSystemImage(name: "trash", config: mediumConfig)
        
        containerView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        imageContainerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        bottomView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setSystemImage(name: "heart", config: mediumConfig)
        bottomView.addSubview(commentTextField)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.borderStyle = .roundedRect
        bottomView.addSubview(commentLabel)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(commentButton)
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setSystemImage(name: "paperplane.circle.fill", config: largeConfig)
        commentButton.layer.cornerRadius = 15
        bottomView.addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setSystemImage(name: "arrow.left", config: largeConfig)
        
        bottomView.addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.setSystemImage(name: "arrow.right", config: largeConfig)
        

        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        
            imageContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            imageContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/3),
            imageContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor),
            
            deleteButton.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -50),
            deleteButton.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant:  -50),
            
            bottomView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            bottomView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1/1.5),
            bottomView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            
            commentLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
            commentLabel.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 1/4),
            commentLabel.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/2),
            commentLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            
            likeButton.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 50),
            likeButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20),
            
            commentTextField.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            commentTextField.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 20),
            commentTextField.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/1.5),
            commentTextField.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 1/5),
            
            commentButton.topAnchor.constraint(equalTo: commentTextField.topAnchor),
            commentButton.heightAnchor.constraint(equalTo: commentTextField.heightAnchor),
            commentButton.widthAnchor.constraint(equalTo: commentTextField.widthAnchor, multiplier: 1/7),
            commentButton.leftAnchor.constraint(equalTo: commentTextField.rightAnchor, constant: 10),
            
            leftButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            leftButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 1/5),
            leftButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/4),
            leftButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 30),
            
            rightButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            rightButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 1/5),
            rightButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1/4),
            rightButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -30),
        ])
    }
    
}
