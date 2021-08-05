//
//  AvatarCollectionViewCell.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-04.
//

import UIKit

class AvatarCollectionViewCell: UICollectionViewCell {
    
    let avatarImageView: UIImageView = {
        let screenSize: CGRect = UIScreen.main.bounds
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Avatar")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addImageViewAsSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func addImageViewAsSubview() {
        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor).activate(withIdentifier: "avatarCenterXAnchor")
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).activate(withIdentifier: "avatarCenterYAnchor")
    }
}
