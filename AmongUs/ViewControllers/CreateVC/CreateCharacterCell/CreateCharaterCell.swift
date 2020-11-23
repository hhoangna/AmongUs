//
//  CreateCharaterCell.swift
//  AmongUs
//
//  Created by Rum on 11/12/20.
//

import UIKit
import SDWebImage
import SDWebImagePDFCoder

class CreateCharaterCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    
    static let identifierCell = "CreateCharaterCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 8
    }
    
    func setupIcon(icon: IconModel) {
        let PDFCoder = SDImagePDFCoder.shared
        SDImageCodersManager.shared.addCoder(PDFCoder)
        let bitmapSize = CGSize(width: 90, height: 90)
        if let url = URL(string: icon.url) {
            imgCharacter.sd_setImage(with: url, placeholderImage: nil, options: .continueInBackground, context: [.imageThumbnailPixelSize : bitmapSize])
        }
    }
}
