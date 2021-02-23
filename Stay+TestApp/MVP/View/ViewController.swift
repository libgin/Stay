//
//  ViewController.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import UIKit
import Moya

class ViewController: UIViewController, ViewInput, CatcherTableView  {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageView: UIView!
    var tableViewDataSource: TableViewDataSource!
    var output: ViewOutput!
    
    var hotels = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didShowHotels("20014181")
        setupTableView()
        messageView.isHidden = true
    }

    //MARK: - input
    func showHotels(_ hotels: [Hotel]) {
        self.hotels = hotels
        if self.hotels.count > 0 {
            reloadTableView()
        }
    }
    
    func showMessage() {
        messageView.isHidden = false
    }
    //MARK:- table view Actions
    func currentSelected(_ indexPath: IndexPath) {
        
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
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: String.init(describing: HotelCell.self), bundle: nil), forCellReuseIdentifier: String.init(describing: HotelCell.self))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
}


