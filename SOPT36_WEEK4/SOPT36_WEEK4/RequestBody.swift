//
//  RequestBody.swift
//  SOPT36_WEEK4
//
//  Created by 선영주 on 5/3/25.
//
//MARK: - 회원가입 Request 모델
struct RegisterRequestModel: Codable {
    let loginId: String
    let password: String
    let nickname: String
}

//MARK: - 로그인 Request 모델
struct LoginRequestModel: Codable {
    let loginId: String
    let password: String
}
