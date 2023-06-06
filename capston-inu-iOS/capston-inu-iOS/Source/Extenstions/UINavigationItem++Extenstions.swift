//
//  UINavigationItem++Extenstions.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/06.
//

import Foundation
import UIKit

extension UINavigationItem {
    func makeImageButtonItem(_ button: UIButton) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(customView: button)
        
        barButtonItem.customView?.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        return barButtonItem
    }
}
