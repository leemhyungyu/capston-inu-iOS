//
//  GoogleLoginInfo.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/23.
//

import Foundation

struct GoogleLoginInfo: Codable {
    let authToken: String
    let existedMember: Bool
    let xAuthToken: String
    
    enum CodingKeys: String, CodingKey {
        case authToken, existedMember
        case xAuthToken = "rememberedToken"
    }
}

