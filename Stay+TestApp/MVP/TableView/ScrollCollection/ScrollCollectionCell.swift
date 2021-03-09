//
//  ScrollCollectionCell.swift
//  Stay+TestApp
//
//  Created by Victor on 08.03.2021.
//

import UIKit

class ScrollCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lbl: UILabel!
    
    func configureWith(v: String) {
        self.lbl.text = v
    }
}
