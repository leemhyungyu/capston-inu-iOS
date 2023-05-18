//
//  TripDetailSection.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import RxDataSources

enum TripDetailSection {
    case tripSection([TripDetailSectionItem], String)
    case peopleSection([TripDetailSectionItem])
    case commentSection([TripDetailSectionItem])
}

enum TripDetailSectionItem {
    case tripCell(TripInfoCellReactor)
    case peopleCell(TripPeopleCellReactor)
    case commentCell(TripCommentCellReactor)
}

extension TripDetailSection: SectionModelType {
    
    typealias Item = TripDetailSectionItem
    
    var items: [Item] {
        switch self {
        case .tripSection(let items, _):
            return items
        case .peopleSection(let items):
            return items
        case .commentSection(let items):
            return items
        }
    }
    
    var headerTitle: String {
        switch self {
        case .tripSection(_, let title):
            return title
        case .peopleSection:
            return "참여자"
        case .commentSection:
            return "각자의 한마디"
        }
    }
    
    init(original: TripDetailSection, items: [TripDetailSectionItem]) {
        self = original
    }
}


extension TripDetailSection {
    var cellSize: NSCollectionLayoutSize {
        switch self {
        case .tripSection:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(450))
        case .commentSection:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(50))
        case .peopleSection:
            return NSCollectionLayoutSize(
                widthDimension: .estimated(110),
                heightDimension: .estimated(150))
        }
    }
    
    var groupSize: NSCollectionLayoutSize {
        switch self {
        case .tripSection:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(450))
        case .commentSection:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(50))
        case .peopleSection:
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.3),
                heightDimension: .estimated(110))
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .tripSection:
            return 0
        case .peopleSection:
            return 8
        case .commentSection:
            return 30
        }
    }
}
