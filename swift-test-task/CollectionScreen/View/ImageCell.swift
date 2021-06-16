//
//  ImageCell.swift
//  swift-test-task
//
//  Created by Dmitry on 16.06.2021.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    private var activityIndicator: UIActivityIndicatorView?

    @IBOutlet weak var image: UIImageView!

    func prepare(with data: Data) {
        self.image.layer.cornerRadius = 7
        self.image.image = UIImage(data: data)
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.startAnimating()
            activityIndicator.frame = self.bounds
            self.addSubview(activityIndicator)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            if let activity = self.activityIndicator {
                activity.removeFromSuperview()
            }
        }
    }
}
