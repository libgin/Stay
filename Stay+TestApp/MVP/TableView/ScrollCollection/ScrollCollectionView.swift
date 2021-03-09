//
//  ScrollCollectionView.swift
//  Stay+TestApp
//
//  Created by Victor on 08.03.2021.
//

import Foundation
import UIKit

// MARK: -TableViewDelegate
protocol CatcherScrollCollectionView: class {
    func currentSelectedScrollCollection(_ indexPath: IndexPath)
}

class ScrollCollectionViewDataSource: NSObject,UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView
    
    weak var  catcherController: CatcherScrollCollectionView?
    
    var collectionArray = [String]()
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: ScrollCollectionCell.self), for: indexPath) as! ScrollCollectionCell

        cell.configureWith(v: collectionArray[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        catcherController?.currentSelectedScrollCollection(indexPath)
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}
