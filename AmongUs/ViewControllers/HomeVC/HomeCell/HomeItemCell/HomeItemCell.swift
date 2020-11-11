//
//  HomeItemCell.swift
//  AmongUs
//
//  Created by HHumorous on 11/11/2020.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imgWall: UIImageView!
    
    static let identifierCell = "HomeItemCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.withAlphaComponent(0.16).cgColor
    }

}
