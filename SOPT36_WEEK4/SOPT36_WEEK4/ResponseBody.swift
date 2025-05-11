//
//  ResponseBody.swift
//  SOPT36_WEEK4
//
//  Created by 선영주 on 5/3/25.
//
//MARK: - 회원가입 Response
struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResonseBody
}

struct RegisterResonseBody: Codable {
    let userId: Double
    let nickname: String
}

// MARK: - 로그인 Response
struct LoginResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: LoginResponseBody?
}

struct LoginResponseBody: Codable {
    let userId: Int
}
