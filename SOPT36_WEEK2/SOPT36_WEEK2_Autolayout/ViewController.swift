//
//  ViewController.swift
//  SOPT36_WEEK2_Autolayout
//
//  Created by 선영주 on 4/12/25.
//

import UIKit

final class ScrollViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // 색상 배열
    private let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
    private var colorViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }

    private func setLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // 색상 뷰 생성
        for color in colors {
            let view = UIView()
            view.backgroundColor = color
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
            colorViews.append(view)
        }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true

        let boxHeight: CGFloat = 300

        let redView = colorViews[0]
        let orangeView = colorViews[1]
        let yellowView = colorViews[2]
        let greenView = colorViews[3]
        let blueView = colorViews[4]
        let purpleView = colorViews[5]

        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            redView.heightAnchor.constraint(equalToConstant: boxHeight),

            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orangeView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            orangeView.heightAnchor.constraint(equalToConstant: boxHeight)
        ])

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            yellowView.heightAnchor.constraint(equalToConstant: boxHeight),

            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            greenView.heightAnchor.constraint(equalToConstant: boxHeight)
        ])

        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            blueView.heightAnchor.constraint(equalToConstant: boxHeight),

            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            purpleView.heightAnchor.constraint(equalToConstant: boxHeight),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor) // 마지막 뷰
        ])
    }
}
