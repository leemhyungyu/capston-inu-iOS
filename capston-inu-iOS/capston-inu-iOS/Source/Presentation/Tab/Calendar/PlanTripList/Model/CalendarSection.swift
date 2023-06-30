//
//  CalendarSection.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/06.
//

import RxDataSources

enum CalendarSection {
    case calendarSection([CalendarSectionItem])
}

enum CalendarSectionItem {
    case calendarCell(TripList)
}

extension CalendarSection: SectionModelType {
    
    typealias Item = CalendarSectionItem
    
    var items: [Item] {
        switch self {
        case .calendarSection(let items):
            return items
        }
    }
    
    init(original: CalendarSection, items: [CalendarSectionItem]) {
        self = original
    }
}
