//
//  MainViewController.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 15.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    private var pictures = [PictureInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createInitialData()
    }
    
    private func createInitialData() {
        for _ in 1...20 {
            pictures.append(PictureInfo())
        }
    }
}

//MARK: - IBActions
extension MainViewController {
    @IBAction func addNewPicture(_ sender: UIButton) {
        pictures.append(PictureInfo())
        collectionView.reloadData()
        collectionView.scrollToLast()
    }
    
    @IBAction func reloadAllRictures(_ sender: UIButton) {
        pictures.removeAll()
        createInitialData()
        collectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        return cell.setPicture(picture: pictures[indexPath.row])
    }
}
