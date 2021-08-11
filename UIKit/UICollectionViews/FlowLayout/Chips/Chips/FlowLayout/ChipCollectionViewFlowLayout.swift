//
//  ChipCollectionViewFlowLayout.swift
//  Chips
//
//  Created by Jason Dhindsa on 2021-08-11.
//

import UIKit

class ChipCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        scrollDirection = .horizontal
        itemSize = .init(width: 130, height: 30)
        minimumInteritemSpacing = .init(5.0)
        sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}
