//
//  ProductCollectionViewCell.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 21/04/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
