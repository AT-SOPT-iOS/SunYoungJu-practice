//
//  WelcomeViewConroller_Delegate.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/12/25.
//

import UIKit

protocol DataBindDelegate: AnyObject {
    func dataBind(id: String)
}

class WelcomeViewController_DelegatePattern: UIViewController {
    
    weak var delegate: DataBindDelegate?
    var id: String?

    let puppyImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "Icon")
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        return label
    }()
    
    let mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    let reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(puppyImageView)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(mainButton)
        self.view.addSubview(reloginButton)

        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        reloginButton.addTarget(self, action: #selector(reloginButtonDidTapped), for: .touchUpInside)

        bindID()
    }

    private func bindID() {
        if let id = id {
            self.welcomeLabel.text = "\(id)님 \n반가워요!"
        }
    }

    func setLabelText(id: String?) {
        self.id = id
    }

    @objc private func mainButtonTapped() {
        print("메인 버튼 눌림")
    }

    @objc private func reloginButtonDidTapped() {
        if let id = id {
            delegate?.dataBind(id: id)
        }

        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
