//
//  ViewController.swift
//  BasicAnimations
//
//  Created by scott harris on 2/18/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var label: UILabel!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.center = view.center
    }
    
    
    // MARK: - Private
    
    private func configureLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.text = "💃🏻"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 12
        
    }
}

