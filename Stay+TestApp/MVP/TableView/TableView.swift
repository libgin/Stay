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

// MARK: -TableView DataSource
class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView
    weak var  catcherController: CatcherTableView?
    var hotels = [Hotel]()
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: String.init(describing: HotelCell.self)) as! HotelCell
        cell.configureWith(value: hotels[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catcherController?.currentSelected(indexPath)
    }
}

