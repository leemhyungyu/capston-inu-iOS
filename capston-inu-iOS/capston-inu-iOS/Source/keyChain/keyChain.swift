//
//  keyChain.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/23.
//

import UIKit

class XAuthToken {
    
    class func create(xAuthToken: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "xAuthToken",
            kSecValueData: xAuthToken.data(using: .utf8, allowLossyConversion: false) as Any
        ]
        
        SecItemDelete(query)
        
        let status = SecItemAdd(query, nil)
        assert(status == noErr, "토큰 저장 실패")
    }
    
    class func read() -> String? {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "xAuthToken",
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)

        if status == errSecSuccess {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            return value
        } else {
            return ""
        }
    }
    
    class func delete() {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "xAuthToken"
        ]
        
        let status = SecItemDelete(query)
        assert(status == noErr, "토큰 삭제 실패")
    }
}
