//
//  SampleCollectionViewController.swift
//  StoryboardCollectionView
//
//  Created by Jason Dhindsa on 2021-08-01.
//

import UIKit

class SampleCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let dataSet = Array(0...400)
    let cellID = "SampleCell"
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SampleCollectionViewCell
        cell.backgroundColor = .red
        cell.sampleLabel.text = String(dataSet[indexPath.item])
        cell.sampleLabel.font = UIFont(name: "Courier", size: 20)
        cell.sampleLabel.textColor = UIColor.white
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 45, height: 45)
    }
}


