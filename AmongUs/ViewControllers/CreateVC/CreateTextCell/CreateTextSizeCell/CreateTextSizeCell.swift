//
//  CreateTextSizeCell.swift
//  AmongUs
//
//  Created by Rum on 11/12/20.
//

import UIKit

class CreateTextSizeCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderSize: UISlider!
    @IBOutlet weak var btnCenter: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    
    static let identifierCell = "CreateTextSizeCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
