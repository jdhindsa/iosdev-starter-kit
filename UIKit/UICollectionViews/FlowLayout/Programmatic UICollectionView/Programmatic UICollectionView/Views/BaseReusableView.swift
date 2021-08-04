//
//  BaseReusableView.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-03.
//

import UIKit

class BaseReusableView: UICollectionReusableView {
    
    let reusableViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jason"
        return label
    }()
    
    let reusableViewImage: UIImageView = {
         let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.layer.cornerRadius = 8
         imageView.clipsToBounds = true
         imageView.layer.borderWidth = 0.5
         imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
         imageView.contentMode = .scaleAspectFill
         return imageView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        reusableViewImage.image = UIImage(named: "header")
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func addSubviews() {
        addSubview(reusableViewLabel)
        addSubview(reusableViewImage)
        
        reusableViewImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).activate(withIdentifier: "reusableViewImageLeadingAnchor")
        reusableViewImage.topAnchor.constraint(equalTo: topAnchor).activate(withIdentifier: "reusableViewImageTopAnchor")
        reusableViewImage.bottomAnchor.constraint(equalTo: bottomAnchor).activate(withIdentifier: "reusableViewImageBottomAnchor")
        reusableViewImage.widthAnchor.constraint(equalToConstant: 100).activate(withIdentifier: "reusableViewImageWidthAnchor")
        
        reusableViewLabel.leadingAnchor.constraint(equalTo: reusableViewImage.trailingAnchor).activate(withIdentifier: "reusableViewLabelLeadingAnchor")
        reusableViewLabel.topAnchor.constraint(equalTo: reusableViewImage.topAnchor).activate(withIdentifier: "reusableViewLabelTopAnchor")
        reusableViewLabel.bottomAnchor.constraint(equalTo: reusableViewImage.bottomAnchor).activate(withIdentifier: "reusableViewLabelBottomAnchor")
    }
}
