//
//  SampleCollectionViewCell.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-02.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    
    let sampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jason"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addLabelAsSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func addLabelAsSubview() {
        addSubview(sampleLabel)
        sampleLabel.translatesAutoresizingMaskIntoConstraints = false
        sampleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate(withIdentifier: "sampleLabelCenterXAnchor")
        sampleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).activate(withIdentifier: "sampleLabelCenterYAnchor")

    }
}
