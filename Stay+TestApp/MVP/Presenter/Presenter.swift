//
//  Presenter.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import Foundation


class Presenter: ViewOutput {

    weak var view: ViewInput?
    
    var dataManager: DataManager!
    
    func didShowHotels(_ cityID: String)  {
        self.dataManager.obtainHotels(cityID) { hotels in
            self.view?.showHotels(hotels)
        }
    }
    
    func didPressedAction() {
        self.view?.showMessage()
    }
    
}
