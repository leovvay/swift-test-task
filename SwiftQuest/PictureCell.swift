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
    
    func setPicture(picture: PictureInfo) -> Self {
        backgroundColor = UIColor.lightGray
        pictureView.kf.indicatorType = .activity
        
        if picture.imageUrl == nil {
            picture.generateUrl()
        }
        
        pictureView.kf.setImage(with: picture.imageUrl)
        return self
    }
}
