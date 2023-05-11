//
//  UIViewController++Extenstions.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit

extension UIViewController {
    
    func goToMainViewController() {
        let tabBarController = AppTabBarViewController()
        
        tabBarController.modalPresentationStyle = .fullScreen
        
        view.window?.rootViewController = tabBarController
        view.window?.rootViewController?.dismiss(animated: false)
    }
}