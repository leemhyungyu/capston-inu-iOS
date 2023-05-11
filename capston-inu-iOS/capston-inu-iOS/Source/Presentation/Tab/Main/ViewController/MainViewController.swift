//
//  MainViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit
import SnapKit
import MapKit

class MainViewController: UIViewController {

    // MARK: UI Component
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        return mapView
    }()
    
    lazy var changeButton: UIButton = {
       
        let button = UIButton()
        
        var config = UIButton.Configuration.plain()
        var attribute = AttributedString.init("목록 보기")
        attribute.font = .systemFont(ofSize: 16, weight: .bold)
        
        attribute.foregroundColor = .white
        
        config.titleAlignment = .center
        config.background.backgroundColor = .systemBlue
        config.background.cornerRadius = 20
        config.attributedTitle = attribute
        
        button.configuration = config
        
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension MainViewController {
    
    // MARK: - Configure
    func configureUI() {
        
        [   mapView,
            changeButton
        ]   .forEach { view.addSubview($0) }
        
        mapView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        changeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.equalTo(160)
            $0.height.equalTo(40)
        }
    }
}
