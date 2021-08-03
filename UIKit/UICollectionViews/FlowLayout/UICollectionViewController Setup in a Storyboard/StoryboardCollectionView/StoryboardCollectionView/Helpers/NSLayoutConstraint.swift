//
//  NSLayoutConstraint.swift
//  StoryboardCollectionView
//
//  Created by Jason Dhindsa on 2021-08-02.
//

import UIKit

extension NSLayoutConstraint {
    func activate(withIdentifier id: String) {
        (self.identifier, self.isActive) = (id, true)
    }
}
