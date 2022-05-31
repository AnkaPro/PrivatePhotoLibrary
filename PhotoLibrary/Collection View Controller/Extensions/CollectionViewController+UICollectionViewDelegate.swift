
import Foundation
import UIKit

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesSettings.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let addcell = collectionView.dequeueReusableCell(withReuseIdentifier: self.addImageCellId, for: indexPath) as? AddNewImageCollectionViewCell else { return AddNewImageCollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.imageCellId, for: indexPath) as? ImageCollectionViewCell else { return ImageCollectionViewCell() }
        
        addcell.addButton.addTarget(self, action: #selector(self.addImage), for: .touchUpInside)
        
        if indexPath.item == 0 {
            return addcell
        } else {
            if let name = imagesSettings[indexPath.item - 1].name {
                if let image = loadImage(fileName: name) {
                    cell.configure(with: image)
                }
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageViewController.indexOfImage = indexPath.item - 1
        if let navController = self.navigationController {
            navController.pushViewController(self.imageViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let side = (collectionView.frame.size.width)/3.1
        return CGSize(width: side, height: side)
    }
}
