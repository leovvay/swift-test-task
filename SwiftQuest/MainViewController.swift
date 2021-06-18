//
//  MainViewController.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 15.06.2021.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    var pictures = [PictureInfo]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func addNewPicture(_ sender: UIButton) {
        pictures.append(PictureInfo())
        collectionView.reloadData()
    }
    
    @IBAction func reloadAllRictures(_ sender: UIButton) {
        pictures.removeAll()
        createInitialData()
        collectionView.reloadData()
    }
    
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        return cell.setPicture(picture: pictures[indexPath.row])
    }
}
