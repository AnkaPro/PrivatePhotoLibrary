import UIKit

class CollectionViewController: UIViewController {
    
    var imagesSettings = [ImageSettings(name: nil, like: nil, comment: nil)]
    let collectionView = CollectionView()
    let addImageCellId = "addImageCellId"
    let imageCellId = "imageCellId"
    let imageViewController = ImageViewController()
    let keyForImage = "Images"
    let keyForSettings = "Settings"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view = collectionView
        imagesSettings.removeAll()
        self.collectionView.setupUI()
        self.collectionView.imagesCollectionView.delegate = self
        self.collectionView.imagesCollectionView.dataSource = self
        self.collectionView.imagesCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: imageCellId)
        self.collectionView.imagesCollectionView.register(AddNewImageCollectionViewCell.self, forCellWithReuseIdentifier: addImageCellId)
        self.imageViewController.delegate = self
        guard let savedImagePath = UserDefaults.standard.value([ImageSettings].self, forKey: keyForImage) else { return }
        
        imagesSettings = savedImagePath
        self.imageViewController.imageSettings = imagesSettings
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.imagesSettings.isEmpty {
            self.collectionView.addLabel()
        } else {
            self.collectionView.removeLabel()
        }
    }
    
    @objc func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        //        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true)
    }
    
}

extension CollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            if let url = self.createUmageURL(image: image) {
                let imageSettings = ImageSettings(name: url, like: false, comment: "")
                imagesSettings.append(imageSettings)
                self.imageViewController.imageSettings.append(imageSettings)
            }
            UserDefaults.standard.set(encodable: imagesSettings, forKey: keyForImage)
            UserDefaults.standard.set(encodable: self.imageViewController.imageSettings, forKey: keyForSettings)
            
        } else if let image = info[.originalImage] as? UIImage {
            if let url =  self.createUmageURL(image: image) {
                let imageSettings = ImageSettings(name: url, like: false, comment: "")
                imagesSettings.append(imageSettings)
                self.imageViewController.imageSettings.append(imageSettings)
            }
            UserDefaults.standard.set(encodable: imagesSettings, forKey: keyForImage)
            UserDefaults.standard.set(encodable: self.imageViewController.imageSettings, forKey: keyForSettings)
        }
        
        picker.dismiss(animated: true)
        self.collectionView.imagesCollectionView.reloadData()
    }
    
    func createUmageURL(image: UIImage) -> String? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = UUID().uuidString
        
        guard let fileURL = documentsDirectory?.appendingPathComponent(fileName),
              let imageData = image.jpegData(compressionQuality: 1) else { return nil }
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
        
        do {
            try imageData.write(to: fileURL)
            return fileName
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func loadImage(fileName: String) -> UIImage? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        let image = UIImage(contentsOfFile: fileURL.path)
        return image
    }
}



    





