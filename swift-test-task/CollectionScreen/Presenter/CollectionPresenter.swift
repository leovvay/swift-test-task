//
//  CollectionViewModel.swift
//  swift-test-task
//
//  Created by Dmitry on 10.06.2021.
//

import Foundation

protocol CollectionPresenterProtocol {
    var numberOfItemsInSection: Int { get }
    init(view: CollectionViewProtocol, networkService: NetworkServiceProtocol)
    func addImage()
    func cellForItemAt(_ indexPath: IndexPath) -> Data
    func reloadImages()
}

class CollectionPresenter: CollectionPresenterProtocol {

    private unowned var view: CollectionViewProtocol
    private var networkService: NetworkServiceProtocol
    
    private var images = Array<Data>()
    
    var numberOfItemsInSection: Int {
        return images.count
    }
    
    required init(view: CollectionViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    func addImage() {
        self.view.showActivity()
        networkService.getImage { [unowned self] imageData in
            self.images.append(imageData)
            self.view.reloadData()
            self.view.hideActivity()
        }
    }
    
    func cellForItemAt(_ indexPath: IndexPath) -> Data {
        return images[indexPath.row]
    }
    
    func reloadImages() {
        for (index, _) in images.enumerated() {
            networkService.getImage { [unowned self] newImageData in
                self.images.remove(at: index)
                self.images.insert(newImageData, at: index)
                self.view.reloadItemAt(indexPath: IndexPath(row: index, section: 0))
            }
        }
    }
}
