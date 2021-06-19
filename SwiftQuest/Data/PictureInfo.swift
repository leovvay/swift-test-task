//
//  ImageInfo.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 17.06.2021.
//

import Foundation

class PictureInfo {
    
    private static let generatorUrl = "https://loremflickr.com/200/200?lock="
    
    var imageUrl: URL?
    
    func generateUrl() {
        // https://loremflickr.com/200/200 link returns different imge each time.
        // We cant use it like that with reusable collection view cells
        // because it will show different images while scrolling.
        // Here we randomly generate unique url for each image to fix this.
        imageUrl = URL(string: PictureInfo.generatorUrl + "\(Int.random(in: 1...100000))")
    }
}
