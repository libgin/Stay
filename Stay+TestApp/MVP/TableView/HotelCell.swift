//
//  HotelCell.swift
//  Stay+TestApp
//
//  Created by Victor on 22.02.2021.
//

import UIKit
import Nuke

class HotelCell : UITableViewCell {
    
    @IBOutlet weak var hotelPreviewImage: UIImageView!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var reviewScoreLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var freeCancellationStack: UIStackView!
    @IBOutlet weak var prePaymentStack: UIStackView!
    @IBOutlet weak var priceNightLbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var taxeLbl: UILabel!
    @IBOutlet weak var rewardPercentLbl: UILabel!
    @IBOutlet weak var rewardAmountLbl: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var arrowView: UIView!
    
    @IBAction func favoriteBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            favoriteBtn.setImage(#imageLiteral(resourceName: "favorite_selected"), for: .normal)
        } else {
            favoriteBtn.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
   }
    
    func configureWith(value: Hotel) {
        backgroundView?.backgroundColor = .clear
        arrowView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(-45) * .pi/180))
        let imageRequest = ImageRequest(url: NSURL(string: value.image)! as URL,
                                        processors: [ImageProcessors.Resize(size: CGSize(width: 132, height: 231))])
        
        Nuke.loadImage(with: imageRequest, into: hotelPreviewImage)
        
        typeLbl.text = value.type
        reviewScoreLbl.text = "\(value.reviewsScore)"
        titleLbl.text = value.title
        addressLbl.text = value.address
        priceNightLbl.text = "\(value.currency.symbol)\(value.priceNight)"
        pricelbl.text = "\(value.currency.symbol)\(value.price) "
        taxeLbl.text = "+\(value.currency.symbol)\(value.tax) taxes & fees"
        rewardPercentLbl.text = "\(value.rewardPercent)% reward back"
        rewardAmountLbl.text = "\(value.currency.symbol)\(value.rewardAmount)"
        
        
        freeCancellationStack.isHidden = !value.freeCancellation
        prePaymentStack.isHidden = value.prepayment
    }
}

