//
//  NicknameResponseBody.swift
//  SOPT36_WEEK4
//
//  Created by 선영주 on 5/3/25.
//

import Foundation

struct NicknameListResponse: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: Nickname
}

struct Nickname: Codable {
    let nicknameList: [String]
}
