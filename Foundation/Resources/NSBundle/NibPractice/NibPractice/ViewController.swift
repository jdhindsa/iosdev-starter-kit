//
//  ViewController.swift
//  NibPractice
//
//  Created by Jason Dhindsa on 2021-07-22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var tealView: UIView!
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let nibPracticeView = Bundle.main.loadNibNamed("NIBPractice", owner: self, options: nil)?.first as? NIBPractice else { return }
        self.view.addSubview(nibPracticeView)
        nibPracticeView.translatesAutoresizingMaskIntoConstraints = false
        nibPracticeView.xibTitle.text = "Green View"
        nibPracticeView.backgroundColor = .green
        nibPracticeView.xibTitle.textColor = .black
        nibPracticeView.layer.cornerRadius = 18
        
        NSLayoutConstraint.activate([
            nibPracticeView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 16),
            nibPracticeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nibPracticeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nibPracticeView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        guard let anotherNibPracticeView = Bundle.main.loadNibNamed("NIBPractice", owner: self, options: nil)?.first as? NIBPractice else { return }
        self.view.addSubview(anotherNibPracticeView)
        anotherNibPracticeView.translatesAutoresizingMaskIntoConstraints = false
        anotherNibPracticeView.xibTitle.text = "Purple View"
        anotherNibPracticeView.backgroundColor = .purple
        anotherNibPracticeView.xibTitle.textColor = .white
        anotherNibPracticeView.layer.cornerRadius = 18
        
        NSLayoutConstraint.activate([
            anotherNibPracticeView.topAnchor.constraint(equalTo: nibPracticeView.bottomAnchor, constant: 16),
            anotherNibPracticeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            anotherNibPracticeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            anotherNibPracticeView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        guard let yetAgainAnotherNibPracticeView = Bundle.main.loadNibNamed("NIBPractice", owner: self, options: nil)?.first as? NIBPractice else { return }
        self.view.addSubview(yetAgainAnotherNibPracticeView)
        yetAgainAnotherNibPracticeView.translatesAutoresizingMaskIntoConstraints = false
        yetAgainAnotherNibPracticeView.xibTitle.text = "Brown View"
        yetAgainAnotherNibPracticeView.backgroundColor = .brown
        yetAgainAnotherNibPracticeView.xibTitle.textColor = .white
        yetAgainAnotherNibPracticeView.layer.cornerRadius = 18
        
        NSLayoutConstraint.activate([
            yetAgainAnotherNibPracticeView.topAnchor.constraint(equalTo: anotherNibPracticeView.bottomAnchor, constant: 16),
            yetAgainAnotherNibPracticeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            yetAgainAnotherNibPracticeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            yetAgainAnotherNibPracticeView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
