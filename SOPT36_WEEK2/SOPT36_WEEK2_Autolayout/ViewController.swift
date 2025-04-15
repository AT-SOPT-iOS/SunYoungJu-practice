//
//  ViewController.swift
//  autolayout
//
//  Created by 선영주 on 4/12/25.
//


import UIKit

class ViewController: UIViewController {
    
    var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var fourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
//    private let firstView = UIView()
//    private let secondView = UIView()
//    private let thirdView = UIView()
//    private let fourthView = UIView()

//    private func setLayout() {
//        [scrollView, contentView, firstView, secondView, thirdView, fourthView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            self.view.addSubview($0)
//        }
        
    private func setLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        fourthView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(firstView)
        contentView.addSubview(secondView)
        contentView.addSubview(thirdView)
        contentView.addSubview(fourthView)
    
        let height = UIScreen.main.bounds.height / 4
        let width = UIScreen.main.bounds.width / 2
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
            
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
           heightConstraint.priority = .defaultLow
           heightConstraint.isActive = true
    
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            firstView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            firstView.heightAnchor.constraint(equalToConstant: height),
            firstView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor),
            secondView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            secondView.heightAnchor.constraint(equalToConstant: height),
            secondView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor),
            thirdView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thirdView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thirdView.heightAnchor.constraint(equalToConstant: height),
            thirdView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fourthView.topAnchor.constraint(equalTo: thirdView.bottomAnchor),
            fourthView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fourthView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            fourthView.heightAnchor.constraint(equalToConstant: height),
            fourthView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}
