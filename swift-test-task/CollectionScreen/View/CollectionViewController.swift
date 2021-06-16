//
//  CollectionViewController.swift
//  swift-test-task
//
//  Created by Dmitry on 10.06.2021.
//

import UIKit

protocol CollectionViewProtocol: AnyObject {
    func reloadItemAt(indexPath: IndexPath)
    func reloadData()
    func showActivity()
    func hideActivity()
}

class CollectionViewController: UIViewController, StoryboardInit {
    
    var presenter: CollectionPresenterProtocol!
    
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var collection: UICollectionView!
    
    private var addImageItem: UIBarButtonItem!
    private var reloadImagesItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addImageItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImage))
        reloadImagesItem = UIBarButtonItem(title: "Reload All", style: .plain, target: self, action: #selector(reloadImages))
        navigationItem.rightBarButtonItems = [addImageItem, reloadImagesItem]
        
        collection.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
    }
    
    @objc func addImage() {
        presenter.addImage()
    }
    
    @objc func reloadImages() {
        presenter.reloadImages()
    }

}

extension CollectionViewController: CollectionViewProtocol {
    
    func reloadItemAt(indexPath: IndexPath) {
        collection.reloadItems(at: [indexPath])
    }
    
    func reloadData() {
        collection.reloadData()
    }
    
    func showActivity() {
        self.showActivityIndicator()
    }
    
    func hideActivity() {
        self.hideActivityIndicator()
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        page.isHidden = presenter.numberOfItemsInSection > 0 ? false : true
        page.numberOfPages = presenter.numberOfItemsInSection
        return presenter.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell {
            cell.prepare(with: presenter.cellForItemAt(indexPath))
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        page.currentPage = Int(collection.contentOffset.x / collection.frame.size.width);
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: collection.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
