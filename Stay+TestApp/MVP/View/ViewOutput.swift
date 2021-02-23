//
//  ViewOutput.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import Foundation

protocol ViewOutput: AnyObject {
    
    func didShowHotels(_ cityID: String)
    
    func didPressedAction()
    
}
