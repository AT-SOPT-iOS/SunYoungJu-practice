//
//  WelcomeViewController_Closure.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/12/25.
//

import UIKit

class WelcomeViewController_Closure: UIViewController {

    var id: String?
    var loginDataCompletion: ((String) -> Void)?  // 클로저로 값 되돌려주기 위한 변수

    let puppyImageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
    let welcomeLabel = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
    let mainButton = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
    let reloginButton = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        puppyImageView.image = UIImage(named: "Icon")
        view.addSubview(puppyImageView)
        
        welcomeLabel.text = "\(id ?? "??")님\n반가워요!"
        welcomeLabel.numberOfLines = 2
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        view.addSubview(welcomeLabel)

        mainButton.setTitle("메인으로", for: .normal)
        mainButton.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.layer.cornerRadius = 6
        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        view.addSubview(mainButton)

        reloginButton.setTitle("다시 로그인", for: .normal)
        reloginButton.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        reloginButton.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        reloginButton.layer.cornerRadius = 6
        reloginButton.addTarget(self, action: #selector(reloginButtonTapped), for: .touchUpInside)
        view.addSubview(reloginButton)
    }

    @objc func mainButtonTapped() {
        print("메인으로 버튼 눌림")
    }

    @objc func reloginButtonTapped() {
        if let id = id {
            loginDataCompletion?(id)  // 클로저로 데이터 전달
        }

        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
}
