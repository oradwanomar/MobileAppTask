//
//  AddProductCollectionViewCell.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 21/04/2022.
//

import UIKit

class AddProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var prodName: UILabel!
    var removeProduct : (()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func removieAction(_ sender: Any) {
        removeProduct?()
    }
}
