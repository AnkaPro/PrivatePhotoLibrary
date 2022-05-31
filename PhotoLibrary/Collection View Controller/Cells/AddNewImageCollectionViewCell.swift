

import UIKit
import Foundation

class AddNewImageCollectionViewCell: UICollectionViewCell {
    
    let addButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "plus")
        let config = UIImage.SymbolConfiguration(scale: .large)
        addButton.setImage(image?.withConfiguration(config), for: .normal)
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
