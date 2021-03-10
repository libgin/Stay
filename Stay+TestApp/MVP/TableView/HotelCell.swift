//
//  HotelCell.swift
//  Stay+TestApp
//
//  Created by Victor on 22.02.2021.
//

import UIKit
//import Nuke

//protocol HotelCellDel {
//    func scrollCollection(toRow: Int)
//}

//enum CellState: Int {
//    case Photos = 0
//    case Location = 1
//    case Terms = 2
//    case Ratings = 3
//    case CheckIn = 4
//}


class HotelCell : UITableViewCell, HotelCellDelegate {
    
    @IBOutlet /*fileprivate*/ weak var collectionView: UICollectionView!

}

extension HotelCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView?.register(UINib.init(nibName: String.init(describing: CollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String.init(describing: CollectionCell.self))
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated: false) // Stops collection view if it was scrolling.
        collectionView.isPagingEnabled = true
        collectionView.reloadData()
    }
    
    func scrollCollection(toRow: Int) {
        DispatchQueue.main.async {
            self.collectionView.isPagingEnabled = false
            self.collectionView.scrollToItem(at: IndexPath(item: toRow, section: 0), at: .left, animated: true)
            self.collectionView.isPagingEnabled = true
        }
        collectionView.layoutSubviews()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
