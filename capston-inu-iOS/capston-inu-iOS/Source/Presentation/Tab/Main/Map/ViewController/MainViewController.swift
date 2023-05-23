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
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(CustomAnnotationView.self))
        
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
        createAnnotaion()
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
    
        mapView.delegate = self
        
        [   mapView,
        ]   .forEach { view.addSubview($0) }
        
        mapView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    func createAnnotaion() {
        let aPin = CustomAnnotation(title: "",
                                    subtitle: "",
                                    coordinate: CLLocationCoordinate2D(latitude: 37.2,
                                                                       longitude: 127.4))
        let bPin = CustomAnnotation(title: "",
                                    subtitle: "",
                                    coordinate: CLLocationCoordinate2D(latitude: 36.1,
                                                                       longitude: 127.5))
        let cPin = CustomAnnotation(title: "",
                                    subtitle: "",
                                    coordinate: CLLocationCoordinate2D(latitude: 38.3,
                                                                       longitude: 127.3))
        
        let dPin = CustomAnnotation(title: "",
                                    subtitle: "",
                                    coordinate: CLLocationCoordinate2D(latitude: 36.5,
                                                                       longitude: 129.1))
        
        let fPin = CustomAnnotation(title: "",
                                    subtitle: "",
                                    coordinate: CLLocationCoordinate2D(latitude: 36.6,
                                                                       longitude: 129.2))
        
        let annotations: [MKAnnotation] = [aPin, bPin, cPin, dPin, fPin]
        
        mapView.addAnnotations(annotations)
    }
}

// MARK: - MKMapViewDelegate

extension MainViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }

        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: NSStringFromClass(CustomAnnotationView.self), for: annotation)

        return annotationView

    }
}
