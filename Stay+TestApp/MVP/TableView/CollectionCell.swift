//
//  CollectionCell.swift
//  Stay+TestApp
//
//  Created by Victor on 08.03.2021.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var bargroundView: UIView!
    @IBOutlet weak var lbl: UILabel!
    
    func configureWith(v: String) {
        self.lbl.text = v
    }
    
}
