//
//  AppTabBarViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit
import SnapKit

enum TabType {
    case main
    case calendar
    case photo
    
    var title: String {
        switch self {
        case .main:
            return "홈"
        case .calendar:
            return "일정"
        case .photo:
            return "사진"
        }
    }
}

class AppTabBarViewController: UITabBarController {
    
    // MARK: - UI Component
    
    let mainTab = UITabBarItem().setUpTabBarItem(.main)

    let calendarTab = UITabBarItem().setUpTabBarItem(.calendar)
    
    let photoTab = UITabBarItem().setUpTabBarItem(.photo)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
}

extension AppTabBarViewController {
    
    // MARK: - Configure
    func configureTabBar() {
                
        let mainVC = UINavigationController(
            rootViewController: MainViewController())
        
        
        let calendarVC = UINavigationController(
            rootViewController: CalendarViewController())
        
        let photoVC = UINavigationController(
            rootViewController: PhotoViewController())
        
        viewControllers = [mainVC, calendarVC, photoVC]
        
        view.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.backgroundColor = .systemGray5
        mainVC.tabBarItem = mainTab
        calendarVC.tabBarItem = calendarTab
        photoVC.tabBarItem = photoTab
    }
}
