//
//  ChipCollectionViewCell.swift
//  Chips
//
//  Created by Jason Dhindsa on 2021-08-11.
//

import UIKit

class ChipCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBAction func closeChip(_ sender: UIButton) {
        print("**** Close chip!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .systemPink
    }

}
