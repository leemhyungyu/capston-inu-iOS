//
//  CustomAnnotation.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/23.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
//    var title: String?
//    var subtitle: String?
    @objc dynamic var coordinate: CLLocationCoordinate2D

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
//        self.title = title
//        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
