//
//  CalendarSection.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/06.
//

import RxDataSources

enum PlanListSection {
    case calendarSection([PlanListSectionItem])
}

enum PlanListSectionItem {
    case calendarCell(PlanList)
}

extension PlanListSection: SectionModelType {
    
    typealias Item = PlanListSectionItem
    
    var items: [Item] {
        switch self {
        case .calendarSection(let items):
            return items
        }
    }
    
    init(original: PlanListSection, items: [PlanListSectionItem]) {
        self = original
    }
}
