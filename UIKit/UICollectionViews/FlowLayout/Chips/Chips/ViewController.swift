//
//  ViewController.swift
//  Chips
//
//  Created by Jason Dhindsa on 2021-08-10.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var chipsView: UIView!
    
    // MARK: - Instance Variables
    let chipCollectionViewCell = "ChipCollectionViewCell"
    
    // MARK: - IBActions
    @IBAction func toggleViewState(_ sender: UIButton) {
        if chipsView.isHidden {
            showChipsView()
        } else {
            hideChipsView()
        }
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        chipsView.isHidden = true
        setupCollectionView()
        registerCells()
    }
    
    // MARK: - Custom Methods
    private func hideChipsView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.chipsView.alpha = 0.0
        }, completion:  { (value: Bool) in
            self.chipsView.isHidden = !self.chipsView.isHidden
        })
    }
    
    private func showChipsView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.chipsView.alpha = 1.0
        }, completion:  { (value: Bool) in
            self.chipsView.isHidden = !self.chipsView.isHidden
        })
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func registerCells() {
        let nibCell = UINib(nibName: "ChipCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: chipCollectionViewCell)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: chipCollectionViewCell, for: indexPath) as! ChipCollectionViewCell
        cell.genreLabel.text = "Genre"
        cell.layer.cornerRadius = 16.0
        return cell
    }
}
