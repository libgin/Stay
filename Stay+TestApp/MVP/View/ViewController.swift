//
//  ViewController.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import UIKit
import Moya

class ViewController: UIViewController, ViewInput, CatcherTableView, CatcherScrollCollectionView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollCollectionView: UICollectionView!
    
    var tableViewDataSource: TableViewDataSource!
    var scrollCollectionViewDataSource: ScrollCollectionViewDataSource!
    
    var output: ViewOutput!
    
    var hotels = [Hotel]()
    
    var arr = ["адын", "два", "два + два - адын", "4", "5", "6", "7777777777777777"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didShowHotels("20014181")
        setupTableView()
        setupScrollCollectionView()
    }

    //MARK: - input
    func showHotels(_ hotels: [Hotel]) {
        self.hotels = hotels
        if self.hotels.count > 0 {
            reloadTableView()
        }
    }
    
    func showMessage() {
        //messageView.isHidden = false
    }
    //MARK:- table view Actions
    func currentSelected(_ indexPath: IndexPath) {
        
    }
    
    func currentSelectedScrollCollection(_ indexPath: IndexPath) {
        tableViewDataSource.scrollCollection(toRow: indexPath.row)
    }
    
    @IBAction func didTouch(_ sender: Any) {
        output.didPressedAction()
    }

}

extension ViewController {
    
    func reloadTableView() {
        tableViewDataSource.hotels = hotels
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableViewDataSource = TableViewDataSource(tableView: tableView)
        tableViewDataSource.catcherController = self
        tableViewDataSource.hotels = hotels
        tableViewDataSource.collectionArray = arr
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: String.init(describing: HotelCell.self), bundle: nil), forCellReuseIdentifier: String.init(describing: HotelCell.self))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    func reloadScrollCollectionView() {
        tableViewDataSource.hotels = hotels
        tableView.reloadData()
    }
    
    func setupScrollCollectionView() {
        scrollCollectionViewDataSource = ScrollCollectionViewDataSource(collectionView: scrollCollectionView)
        scrollCollectionViewDataSource.catcherController = self
        scrollCollectionViewDataSource.collectionArray = arr
        scrollCollectionView.dataSource = scrollCollectionViewDataSource
        scrollCollectionView.delegate = scrollCollectionViewDataSource
        
        scrollCollectionView?.register(UINib.init(nibName: String.init(describing: ScrollCollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String.init(describing: ScrollCollectionCell.self))
    }
}


