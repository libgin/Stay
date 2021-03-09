//
//  TableView.swift
//  Stay+TestApp
//
//  Created by Victor on 22.02.2021.
//

import UIKit


// MARK: -TableViewDelegate
protocol CatcherTableView: class {
    func currentSelected(_ indexPath: IndexPath)
}

protocol HotelCellDelegate: class {
    func scrollCollection(toRow: Int)
}

// MARK: -TableView DataSource
class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView
    
    weak var catcherController: CatcherTableView?
    
    weak var hotelCellDelegate: HotelCellDelegate?
    
    var hotels = [Hotel]()
    
    var collectionArray = [String]()
    
    var storedOffsets = [Int: CGFloat]()
    
    var delegates: [HotelCell] = []
    
    var state = 0
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? HotelCell else { return }
        
        hotelCellDelegate = tableViewCell
        delegates.append(tableViewCell)
        print("Count        /////", delegates.count)
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
        tableViewCell.collectionView.scrollToItem(at: IndexPath(item: state, section: 0), at: .left, animated: false)
        
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let tableViewCell = cell as? HotelCell else { return }

        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        
        if let index = delegates.firstIndex(where: {$0 == cell}){
            delegates.remove(at: index)
        }
        
        print("Count   ", delegates.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: String.init(describing: HotelCell.self)) as! HotelCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catcherController?.currentSelected(indexPath)
    }
    
    func scrollCollection(toRow: Int) {
        state = toRow
        for item in delegates {
            item.scrollCollection(toRow: toRow)
        }
    }
    
}

extension TableViewDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: CollectionCell.self), for: indexPath) as! CollectionCell

        cell.configureWith(v: collectionArray[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

