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
    
    lazy var tripLocationView: PlanTextFieldView = {
        let view = PlanTextFieldView("여행 장소")
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    lazy var tripNameView: PlanTextFieldView = {
        let view = PlanTextFieldView("여행 제목")
        view.layer.cornerRadius = 15
        
        return view
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
        
        [   dateView,
            tripLocationView,
            tripNameView    ]   .forEach { view.addSubview($0) }
        
        dateView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
        
        tripLocationView.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
        
        tripNameView.snp.makeConstraints {
            $0.top.equalTo(tripLocationView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
    }
}
