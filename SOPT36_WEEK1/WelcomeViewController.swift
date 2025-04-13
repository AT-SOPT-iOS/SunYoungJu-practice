//
//  Untitled.swift
//  SOPT36_WEEK1
//
//  Created by 선영주 on 4/5/25.
//

import UIKit

class ViewController: UIViewController {

    var id: String = ""

    private func bindID() {
        self.welcomeLabel.text = "\(id)님 \n반가워요!"
    }
}
