
import UIKit

class MainNavigationController: UINavigationController {
    
    let collectionVC = CollectionViewController()
    let loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(self.loginVC, animated: true)
    }
}
