//
//  ViewController.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-02.
//

import UIKit

class ViewController: UIViewController {
    
    var myCollectionView:UICollectionView?
    let dataSet = Array(0...400)
    var layout: UICollectionViewFlowLayout?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFlowLayout()
        configureCollectionView()
    }
    
    func configureFlowLayout() {
        layout = UICollectionViewFlowLayout()
        guard let layout = self.layout else { return }
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
    }

    func configureCollectionView() {
        // Note: The UICollectionView is being embedded in UIView container
        let view = UIView()
        guard let layout = self.layout else { return }
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.register(SampleCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = UIColor.white
        view.addSubview(myCollectionView ?? UICollectionView())
        self.view = view
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! SampleCollectionViewCell
        cell.sampleLabel.text = String(dataSet[indexPath.item])
        cell.sampleLabel.font = UIFont(name: "Courier", size: 20)
        cell.sampleLabel.textColor = UIColor.white

        return cell
    }
    
    
}

