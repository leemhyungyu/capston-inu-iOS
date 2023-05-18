//
//  UIButton++Extenstions.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit

extension UIButton {
    
    /// 로그인 버튼 Configuration 설정
    func setUpLoginButton(_ type: LoginType) {
        
        var config = UIButton.Configuration.plain()
        var attribute = AttributedString.init(type.title)
    
        attribute.font = .systemFont(ofSize: 14, weight: .semibold)
        attribute.foregroundColor = .black
        
        config.titleAlignment = .center
        config.imagePadding = 80
        config.image = type.image
        config.attributedTitle = attribute
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80)
        config.background.strokeColor = .black
        
        self.backgroundColor = type.backgroundColor
        self.configuration = config
    }
    
    func setUpTripDetailButton(_ title: String) {
        
        var config = UIButton.Configuration.plain()
        var attribute = AttributedString.init(title)
        
        attribute.font = .systemFont(ofSize: 16, weight: .bold)
        attribute.foregroundColor = .black
        
        config.titleAlignment = .center
        config.attributedTitle = attribute
        config.background.strokeColor = .systemGray3
        
        
        self.configuration = config
    }
}
