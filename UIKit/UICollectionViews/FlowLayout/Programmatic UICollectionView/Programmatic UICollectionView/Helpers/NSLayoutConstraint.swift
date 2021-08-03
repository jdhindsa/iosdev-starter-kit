//
//  NSLayoutConstraint.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-02.
//

import UIKit

extension NSLayoutConstraint {
    func activate(withIdentifier id: String) {
        (self.identifier, self.isActive) = (id, true)
    }
}
