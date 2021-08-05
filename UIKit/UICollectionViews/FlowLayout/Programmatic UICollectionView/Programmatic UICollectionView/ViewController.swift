//
//  ViewController.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-02.
//

import UIKit

class ViewController: UIViewController {
    
    var myCV:UICollectionView?
//    let dataSet = Array(0...400)
    var layout = SampleFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = SampleFlowLayout()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        // Note: The UICollectionView is being embedded in UIView container
        let view = UIView()
        myCV = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCV?.dataSource = self
        myCV?.delegate = self
        registerCells()
        myCV?.backgroundColor = UIColor.white
        view.addSubview(myCV ?? UICollectionView())
        self.view = view
    }
    
    func registerCells() {
        myCV?.register(AvatarCollectionViewCell.self, forCellWithReuseIdentifier: AvatarCollectionViewCell.reuseIdentifier())
        myCV?.register(BaseReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseReusableView.reuseIdentifier())
        myCV?.register(BaseReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BaseReusableView.reuseIdentifier())
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        400
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("**** item: \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvatarCollectionViewCell.reuseIdentifier(), for: indexPath) as! AvatarCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaseReusableView.reuseIdentifier(), for: indexPath) as! BaseReusableView
            headerView.backgroundColor = .systemBlue
            headerView.reusableViewLabel.text = "This is my Header!"
            return headerView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaseReusableView.reuseIdentifier(), for: indexPath) as! BaseReusableView
            footerView.backgroundColor = .systemGray
            footerView.reusableViewLabel.text = "This is my Footer!"
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

