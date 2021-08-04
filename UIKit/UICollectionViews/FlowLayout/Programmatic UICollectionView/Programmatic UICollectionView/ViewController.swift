//
//  ViewController.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-02.
//

import UIKit

class ViewController: UIViewController {
    
    var myCV:UICollectionView?
    let dataSet = Array(0...400)
    var layout: UICollectionViewFlowLayout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFlowLayout()
        setupCollectionView()
    }
    
    func configureFlowLayout() {
        layout = UICollectionViewFlowLayout()
        guard let layout = self.layout else { return }
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.headerReferenceSize = CGSize(width: self.myCV?.bounds.size.width ?? 0, height: 75)
        layout.footerReferenceSize = CGSize(width: self.myCV?.bounds.size.width ?? 0, height: 75)
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionFootersPinToVisibleBounds = true
        self.layout = layout
    }
    
    func setupCollectionView() {
        // Note: The UICollectionView is being embedded in UIView container
        let view = UIView()
        guard let layout = self.layout else { return }
        myCV = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        myCV?.dataSource = self
        myCV?.delegate = self
        myCV?.register(SampleCollectionViewCell.self, forCellWithReuseIdentifier: SampleCollectionViewCell.reuseIdentifier())
        myCV?.register(BaseReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseReusableView.reuseIdentifier())
        myCV?.register(BaseReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BaseReusableView.reuseIdentifier())
        myCV?.backgroundColor = UIColor.white
        view.addSubview(myCV ?? UICollectionView())
        self.view = view
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.reuseIdentifier(), for: indexPath) as! SampleCollectionViewCell
        cell.sampleLabel.text = String(dataSet[indexPath.item])
        cell.sampleLabel.font = UIFont(name: "Courier", size: 20)
        cell.sampleLabel.textColor = UIColor.white
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

