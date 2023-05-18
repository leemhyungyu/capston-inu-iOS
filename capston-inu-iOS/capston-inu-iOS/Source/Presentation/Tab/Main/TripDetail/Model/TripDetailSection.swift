//
//  TripDetailSection.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import RxDataSources

enum TripDetailSection {
    case tripSection([TripDetailSectionItem])
    case peopleSection([TripDetailSectionItem])
    case commentSection([TripDetailSectionItem])
}

enum TripDetailSectionItem {
    case tripCell
    case peopleCell
    case commentCell
}

extension TripDetailSection: SectionModelType {
    
    typealias Item = TripDetailSectionItem
    
    var items: [Item] {
        switch self {
        case .tripSection(let items):
            return items
        case .peopleSection(let items):
            return items
        case .commentSection(let items):
            return items
        }
    }
    
    init(original: TripDetailSection, items: [TripDetailSectionItem]) {
        self = original
    }
}
