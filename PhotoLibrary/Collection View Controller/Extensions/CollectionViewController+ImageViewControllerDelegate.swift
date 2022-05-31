import Foundation
import UIKit

extension CollectionViewController: ImageViewControllerDelegate {
    func deleteImage(at index: Int) {
        self.imagesSettings.remove(at: index)
        self.collectionView.imagesCollectionView.reloadData()
        UserDefaults.standard.set(encodable: imagesSettings, forKey: keyForImage)
    }
}
