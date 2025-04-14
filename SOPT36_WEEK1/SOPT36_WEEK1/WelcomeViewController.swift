//
//  Untitled.swift
//  SOPT36_WEEK1
//
//  Created by 선영주 on 4/5/25.
//

import UIKit

final class WelcomeViewController: UIViewController {

    private var id: String?

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 108, y: 140, width: 198, height: 198))
        imageView.image = UIImage(named: "carrot")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 360, width: 236, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 22)
        return label
    }()

    private let backToMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 450, width: 332, height: 58))
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.layer.cornerRadius = 6
        return button
    }()

    private let backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 526, width: 332, height: 58))
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        button.layer.cornerRadius = 6
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(backToMainButton)
        view.addSubview(backToLoginButton)

        bindID()

        backToMainButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        backToLoginButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }

    func setLabelText(id: String?) {
        self.id = id
    }

    private func bindID() {
        titleLabel.text = "\(id ?? "게스트")님\n반가워요!"
    }

    @objc
    private func backToLoginButtonDidTap() {
        if navigationController == nil {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
