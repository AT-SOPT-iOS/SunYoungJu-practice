//
//  LoginInfoViewController.swift
//  SOPT36_WEEK4
//
//  Created by 선영주 on 5/8/25.
//
import UIKit
import SnapKit
import Then

final class LoginInfoViewController: UIViewController {

    private var loginId: String = ""
    private var password: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            break
        }
    }

    @objc private func loginButtonTap() {
            Task {
                do {
                    let response = try await LoginService.shared.PostLoginData(
                        loginId: loginId,
                        password: password
                    )
                    UserDefaults.standard.set(response.userId, forKey: "userId")

                    // 로그인 성공하면 닉넴 변경으로 넘어가기
                    showAlert(title: "로그인 성공", message: "userId: \(response.userId)") { [weak self] in
                        let nicknameVC = NicknameEditViewController()
                        self?.present(nicknameVC, animated: true)
                    }

                } catch {
                    showAlert(title: "로그인 실패", message: "\(error.localizedDescription)")
                }
            }
        }

    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }

        [idTextField, passwordTextField, loginButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
    }

    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }

    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.addTarget(self,
                     action: #selector(loginButtonTap),
                     for: .touchUpInside)
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}


