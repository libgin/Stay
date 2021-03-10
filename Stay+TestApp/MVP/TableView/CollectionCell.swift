//
//  CollectionCell.swift
//  Stay+TestApp
//
//  Created by Victor on 08.03.2021.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var bargroundView: UIView!
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet /*fileprivate*/ weak var collectionView: UICollectionView!
    
    func configureWith(v: String) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView?.register(UINib.init(nibName: String.init(describing: ScrollCollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String.init(describing: ScrollCollectionCell.self))
        
        self.lbl.text = v
    }

}

extension CollectionCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: ScrollCollectionCell.self), for: indexPath) as! ScrollCollectionCell
        return cell
    }
}
