//
//  UIImageView +ext.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import UIKit

///  Честно подсмотрено на просторах stockoverflow, было интересно попробовать
extension UIImageView {
    
    private func downloaded(from url: URL, size: CGSize?) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                if let size = size {
                    self?.image = self?.resizeImage(image: image, targetSize: size)
                } else {
                    self?.image = image
                }
            }
        }.resume()
    }
    
    func downloaded(from link: String, scaledToSize: CGSize? = nil) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, size: scaledToSize)
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = CGSize(width: size.width * widthRatio, height: size.height * heightRatio)
        let rect = CGRect(origin: .zero, size: newSize)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
