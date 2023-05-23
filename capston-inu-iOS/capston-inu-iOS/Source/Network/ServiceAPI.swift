//
//  ServiceAPI.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/21.
//

import Alamofire
import GoogleSignIn
import RxSwift

enum NetworkError: Error {
    case invalidParameters
    case invalidURL
    case invalidResponse
    case decodingError
    case unknownError
    case statusCodeMoreThan400(String, String)
}


public func networking<T: Decodable>(
    urlStr: String,
    method: HTTPMethod,
    data: Data?,
    model: T.Type) -> Observable<T> {
    
    return Observable<T>.create { observer in
        
        guard let url = URL(string: baseURL + urlStr) else {
            observer.onError(NetworkError.invalidURL)
            return Disposables.create()
        }
        var reqeust = URLRequest(url: url)
        reqeust.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        reqeust.setValue(XAuthToken.read() ?? "", forHTTPHeaderField: "X-AUTH-TOKEN")
        
        reqeust.httpBody = data
        reqeust.method = method

        AF.request(reqeust)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: model.self) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    print(error)
                    observer.onError(error)
                }
            }
        
        return Disposables.create()
    }
}

final class API {
    
    /// 구글 로그인
    static func googleLogin(_ token: String) -> Observable<GoogleLoginInfo> {
        let params = ["token": token]
        
        guard let data = try? JSONSerialization.data(
            withJSONObject: params,
            options: .prettyPrinted
        ) else {
            return Observable.error(NetworkError.invalidParameters)
        }
        
        return networking(
            urlStr: "login/oauth2/GOOGLE",
            method: .post,
            data: data,
            model: GoogleLoginInfo.self)
    }
}

