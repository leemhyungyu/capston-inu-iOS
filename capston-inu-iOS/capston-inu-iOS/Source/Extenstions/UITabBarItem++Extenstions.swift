//
//  UITabBarItem++Extenstions.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit

extension UITabBarItem {
    
    func setUpTabBarItem(_ type: TabType) -> UITabBarItem {
        
        let item = UITabBarItem()
        
        item.title = type.title
        
        return item
    }
}
