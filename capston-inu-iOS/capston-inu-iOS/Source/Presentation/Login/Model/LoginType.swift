//
//  LoginType.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit

enum LoginType {
    case google
    
    var title: String {
        switch self {
        case .google:
            return "Google로 로그인"
        }
    }
        
    var image: UIImage {
        switch self {
        case .google:
            return UIImage(named: "google")!
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .google:
            return .white
        }
    }
}
