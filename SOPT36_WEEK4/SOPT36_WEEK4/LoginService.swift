//
//  LoginService.swift
//  SOPT36_WEEK4
//
//  Created by 선영주 on 5/8/25.
//
import Foundation

class LoginService {

    static let shared = LoginService()
    private init() {}

    // RequestBody 만들기
    func makeRequestBody(loginId: String,
                         password: String) -> Data? {
        do {
            let data = LoginRequestModel(loginId: loginId,
                                         password: password)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print("RequestBody 인코딩 에러:", error)
            return nil
        }
    }

    // Request 만들기
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        return request
    }

    // 실제 네트워크 요청
    func PostLoginData(loginId: String,
                       password: String) async throws -> LoginResponseBody {

        // body 만들기 실패하면 바로 에러 throw
        guard let body = makeRequestBody(loginId: loginId, password: password) else {
            throw NetworkError.requestEncodingError
        }

        let request = makeRequest(body: body)

        // await로 비동기 네트워크 요청
        let (data, response) = try await URLSession.shared.data(for: request)

        // response가 HTTP 응답인지 확인
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        // HTTP status code 검사
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }

        // 디코딩
        do {
            let decoded = try JSONDecoder().decode(LoginResponseWrapper.self, from: data)

            guard let responseData = decoded.data else {
                throw NetworkError.responseDecodingError
            }

            return responseData

        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}

