//
//  LoginViewController_Closure.swift
//  SOPT36_WEEK2
//
//  Created by 선영주 on 4/12/25.
//

import UIKit

final class LoginViewController_Closure: UIViewController {
    
    var id: String?

    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
        
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addViews()
        loginButton.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
    }

    func addViews(){
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }

    @objc func loginButtonDidTapped() {
        let welcomeVC = WelcomeViewController_Closure()
        welcomeVC.id = idTextField.text
        welcomeVC.loginDataCompletion = { [weak self] returnedID in
            self?.idTextField.text = returnedID
        }
        self.present(welcomeVC, animated: true)
    }
}
