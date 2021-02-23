//
//  Assembly.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import Foundation
import UIKit

class Assembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? ViewController else { return }
        
        let presenter = Presenter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view
        presenter.dataManager = dataManager
        
        
    }
    
}
