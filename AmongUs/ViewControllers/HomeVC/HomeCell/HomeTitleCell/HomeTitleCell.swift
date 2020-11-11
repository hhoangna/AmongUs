//
//  HomeTitleCell.swift
//  AmongUs
//
//  Created by HHumorous on 11/11/2020.
//

import UIKit

class HomeTitleCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    static let identifierCell = "HomeTitleCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
