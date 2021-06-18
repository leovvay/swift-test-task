//
//  ImageInfo.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 17.06.2021.
//

import Foundation

class PictureInfo {
    var imageUrl: URL?
    
    func generateUrl() {
        imageUrl = URL(string: "https://loremflickr.com/200/200?lock=\(Int.random(in: 1...100000))")
    }
}
