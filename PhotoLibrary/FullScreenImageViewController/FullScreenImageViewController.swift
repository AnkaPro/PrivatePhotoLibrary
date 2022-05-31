
import UIKit

class FullScreenImageViewController: UIViewController {
    
    let fullscreenView = FullScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = fullscreenView
        self.fullscreenView.closeButton.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
    }

    func config(image: UIImage) {
        self.fullscreenView.imageView.image = image
    }
    
    @objc func dismissController() {
        self.dismiss(animated: true)
    }

}
