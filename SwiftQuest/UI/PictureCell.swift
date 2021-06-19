//
//  PictureCell.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 17.06.2021.
//

import UIKit
import Kingfisher

class PictureCell: UICollectionViewCell {
    @IBOutlet weak var pictureView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.lightGray
        pictureView.kf.indicatorType = .activity
    }
    
    func setPicture(picture: PictureInfo) -> Self {
        
        if picture.imageUrl == nil {
            picture.generateUrl()
        }
        
        pictureView.kf.setImage(with: picture.imageUrl)
        return self
    }
}
