//
//  TripSection.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import RxDataSources
import RxSwift

enum TripSection {
    case first([TripSectionItem])
}

enum TripSectionItem {
    case item(listModel)
}

extension TripSection: SectionModelType {
    typealias Item = TripSectionItem
    
    var items: [Item] {
        switch self {
        case .first(let items):
            return items
        }
    }
    
    init(original: TripSection, items: [TripSectionItem]) {
        switch original {
        case .first:
            self = .first(items)
        }
    }
}
