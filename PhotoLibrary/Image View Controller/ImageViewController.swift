
import UIKit

class ImageViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: let/var
    weak var delegate: ImageViewControllerDelegate?
    var imageSettings = [ImageSettings(name: nil, like: nil, comment: nil)]
    var indexOfImage = Int()
    let fullScreenImageVC = FullScreenImageViewController()
    let contentView = ImageViewControllerView()
    let keyForImage = "Images"
    let keyForSettings = "Settings"
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = contentView
        contentView.commentTextField.delegate = self
        guard let nameOfImage = self.imageSettings[indexOfImage].name else { return }
        let loadImage = loadImage(fileName: nameOfImage)
        self.contentView.imageView.image = loadImage
       
        addTapGestureRecognizer()
        contentView.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        contentView.commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        contentView.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        contentView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        contentView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        checkLikeButton()
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let settings = UserDefaults.standard.value([ImageSettings].self, forKey: keyForSettings) else { return }
        imageSettings = settings
        guard let nameOfImage = self.imageSettings[indexOfImage].name else { return }
        let loadImage = loadImage(fileName: nameOfImage)
        self.contentView.imageView.image = loadImage
        print("index: \(indexOfImage)")
        checkLikeButton()
        checkCommentLabel()
    }
    
    // MARK: funcs
    func checkCommentLabel() {
        guard let settings = UserDefaults.standard.value([ImageSettings].self, forKey: keyForSettings) else { return }
        
        self.contentView.commentLabel.text = settings[indexOfImage].comment
    }
    
    func checkLikeButton() {
        guard let settings = UserDefaults.standard.value([ImageSettings].self, forKey: keyForSettings) else { return }
        if settings[indexOfImage].like == true {
            contentView.likeButton.setSystemImage(name: "heart.fill", config: contentView.mediumConfig)
        } else {
            contentView.likeButton.setSystemImage(name: "heart", config: contentView.mediumConfig)
        }
    }
    
    func loadImage(fileName: String) -> UIImage? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        let image = UIImage(contentsOfFile: fileURL.path)
        return image
    }
    
    @objc func likeButtonTapped() {
        if imageSettings[indexOfImage].like == false {
            imageSettings[indexOfImage].like = true
            contentView.likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: contentView.mediumConfig), for: .normal)

            UserDefaults.standard.set(encodable: imageSettings, forKey: keyForSettings)
        } else {
            imageSettings[indexOfImage].like = false
            contentView.likeButton.setImage(UIImage(systemName: "heart", withConfiguration:contentView.mediumConfig), for: .normal)

            UserDefaults.standard.set(encodable: imageSettings, forKey: keyForSettings)
        }
    }
    
   @objc func commentButtonTapped() {
       self.contentView.commentLabel.text = contentView.commentTextField.text
       self.imageSettings[indexOfImage].comment = contentView.commentTextField.text
        UserDefaults.standard.set(encodable: imageSettings, forKey: keyForSettings)
       self.contentView.commentTextField.text?.removeAll()
   }
    
    @objc func leftButtonTapped() {
        if self.indexOfImage != 0 {
            self.indexOfImage -= 1
        } else {
            self.indexOfImage = self.imageSettings.count - 1
        }
        guard let nameOfPreviousImage = imageSettings[indexOfImage].name else { return }
        let previousImage = loadImage(fileName: nameOfPreviousImage)
        UIView.animate(withDuration: 0.4) {
            self.contentView.imageView.image = previousImage
        }
        
        checkLikeButton()
        checkCommentLabel()
    }
    
    @objc func rightButtonTapped() {
        if self.indexOfImage != self.imageSettings.count - 1 {
            self.indexOfImage += 1
        } else {
            self.indexOfImage = 0
        }
        guard let nameOfNextImage = imageSettings[indexOfImage].name else { return }
        let nextImage = loadImage(fileName: nameOfNextImage)
        UIView.animate(withDuration: 0.4) {
            self.contentView.imageView.image = nextImage
        }
        checkLikeButton()
        checkCommentLabel()
    }
    
    @objc func deleteButtonTapped() {
        self.createDeleteAlert()
    }
    
    func createDeleteAlert() {
        let alert = UIAlertController(title: "Delete this photo?", message: "Are you sure you want to delete this photo?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { _ in
            self.deleteImage()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("cancel")
        }))
        self.present(alert, animated: true)
    }
    
    func deleteImage() {
        if self.imageSettings.count != 0 {
        self.imageSettings.remove(at: self.indexOfImage)
        self.delegate?.deleteImage(at: self.indexOfImage)
        }
        UserDefaults.standard.set(encodable: self.imageSettings, forKey: self.keyForSettings)
        UserDefaults.standard.set(encodable: self.imageSettings, forKey: self.keyForImage)
        if self.imageSettings.isEmpty {
            self.dismiss(animated: true)
        }
        if self.indexOfImage != self.imageSettings.count  {
            guard let nameOfImage = self.imageSettings[self.indexOfImage].name else { return }
            let loadImage = self.loadImage(fileName: nameOfImage)
            self.contentView.imageView.image = loadImage
        } else if self.indexOfImage != 0 {
            guard let nameOfImage = self.imageSettings[self.indexOfImage - 1].name else { return }
            let loadImage = self.loadImage(fileName: nameOfImage)
            self.contentView.imageView.image = loadImage
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
        if self.indexOfImage != 0 {
        self.indexOfImage -= 1
        }
        print("delete")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contentView.scrollView.setContentOffset(CGPoint.zero, animated: true)
        self.view.endEditing(true)
        return true
    }
    
    func addTapGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleGestureRecognizer(recognizer:)))
        self.contentView.imageContainerView.addGestureRecognizer(recognizer)
    }
    
    @objc func handleGestureRecognizer(recognizer: UITapGestureRecognizer) {
        print("recognizer")
        guard let image = self.contentView.imageView.image else { return }
        self.fullScreenImageVC.config(image: image)
        self.fullScreenImageVC.modalPresentationStyle = .fullScreen
        self.present(self.fullScreenImageVC, animated: true)
    }
}

// MARK: extensions
extension UIButton {
    func setSystemImage(name: String, config: UIImage.SymbolConfiguration) {
        self.setImage(UIImage(systemName: name, withConfiguration: config), for: .normal)
    }
}

protocol ImageViewControllerDelegate: AnyObject {
    func deleteImage(at index: Int)
}
