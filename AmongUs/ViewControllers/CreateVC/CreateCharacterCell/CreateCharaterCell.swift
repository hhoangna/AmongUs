//
//  CreateCharaterCell.swift
//  AmongUs
//
//  Created by Rum on 11/12/20.
//

import UIKit
import SDWebImage

class CreateCharaterCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    
    static let identifierCell = "CreateCharaterCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 8
    }
    
    func setupIcon(icon: IconModel) {
        if let url = URL(string: icon.url) {
            let image = Utils.shared.drawPDFfromURL(url: url)
            imgCharacter.image = image
        }
    }
}
