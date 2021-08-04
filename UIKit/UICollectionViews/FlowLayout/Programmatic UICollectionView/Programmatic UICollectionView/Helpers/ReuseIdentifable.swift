//
//  ReuseIdentifable.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-03.
//

import UIKit

protocol ReuseIdentifiable {
    static func reuseIdentifier() -> String
}

extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReuseIdentifiable {}
