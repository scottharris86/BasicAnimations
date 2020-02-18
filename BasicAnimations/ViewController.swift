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
        configureButtons()
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
    
    private func configureButtons() {
        let rotateButton = UIButton(type: .system)
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotateButton)
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let springButton = UIButton(type: .system)
        springButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(springButton)
        springButton.setTitle("Spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        
        let keyButton = UIButton(type: .system)
        keyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyButton)
        keyButton.setTitle("Key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        
        let squashButton = UIButton(type: .system)
        squashButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(squashButton)
        squashButton.setTitle("Squash", for: .normal)
        squashButton.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        
        let anticipationButton = UIButton(type: .system)
        anticipationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(anticipationButton)
        anticipationButton.setTitle("Anticipation", for: .normal)
        anticipationButton.addTarget(self, action: #selector(anticipationButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(keyButton)
        stackView.addArrangedSubview(squashButton)
        stackView.addArrangedSubview(anticipationButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
    
    // MARK: - Actions
    
    @objc private func rotateButtonTapped() {
        label.center = view.center
        
        UIView.animate(withDuration: 2, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }) { (_) in
            UIView.animate(withDuration: 2) {
                self.label.transform = .identity
            }
        }
    }
    
    @objc private func springButtonTapped() {
        label.center = view.center
        
        label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    @objc private func keyButtonTapped() {
        label.center = view.center
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.label.transform = .identity
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.label.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.label.center = self.view.center
            }
        }, completion: nil)
    }
    
    @objc private func squashButtonTapped() {
        label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let animationsBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                self.label.center = self.view.center
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15) {
                self.label.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15) {
                self.label.transform = .identity
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationsBlock, completion: nil)
    }
    
    @objc private func anticipationButtonTapped() {
        label.center = view.center
        
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 16)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 16)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                self.label.center = CGPoint(x: self.view.bounds.size.width + self.label.bounds.size.width, y: self.view.center.y)
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
}

