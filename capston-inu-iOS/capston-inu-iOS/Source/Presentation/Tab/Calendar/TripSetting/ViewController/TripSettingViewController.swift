//
//  TripSettingViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/30.
//

import UIKit
import SnapKit

class TripSettingViewController: UIViewController {
    
    // MARK: - UI Component
    lazy var dateView: PlanDateView = {
        let dateView = PlanDateView()
        dateView.layer.cornerRadius = 15
        return dateView
    }()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitleAndBackButton("여행 대표 일정")
        configureUI()
    }
}

extension TripSettingViewController {
    
    func configureUI() {
     
        view.backgroundColor = .systemGray6
        
        [   dateView    ]   .forEach { view.addSubview($0) }
        
        dateView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
    }
}
