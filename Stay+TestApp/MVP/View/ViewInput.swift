//
//  ViewInput.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import Foundation

protocol ViewInput: AnyObject {

    func showHotels(_ hotels: [Hotel])
    
    func showMessage()
}
