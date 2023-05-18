//
//  MainViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit
import SnapKit
import MapKit
import RxSwift
import RxCocoa
import ReactorKit
import FloatingPanel

class MainViewController: UIViewController, View {

    // MARK: - Properties
    
    lazy var reactor = MainReactor()
    var disposeBag = DisposeBag()
    
    // MARK: UI Component
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        
        return mapView
    }()
    
    lazy var tripListView: FloatingPanelController = {
       
        let fpc = FloatingPanelController()
        var tripListVC = TripListViewController()
        
        tripListVC.reactor = TripListReactor()
        
        fpc.set(contentViewController: tripListVC)
        fpc.addPanel(toParent: self)
        fpc.layout = CustomFloatingPanelLayout()
        return fpc
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind(reactor: reactor)
        tripListView.show()
    }
}

extension MainViewController {
    
    // MARK: - bind
    func bind(reactor: MainReactor) {
        
    }
    
    // MARK: - Configure
    func configureUI() {
        
        [   mapView,
        ]   .forEach { view.addSubview($0) }
        
        mapView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
}

