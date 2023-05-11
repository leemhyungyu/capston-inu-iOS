//
//  TripListReactor.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import ReactorKit

struct listModel {
    var tripImage: String?
    var tripTitle: String
    var date: String
}

class TripListReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case didTapCell(IndexPath)
    }
    
    enum Mutation {
        case setPresentVC(Bool)
    }
    
    init() {
        initialState = State(sections: TripListReactor.setUpSections())
    }
    
    struct State {
        var sections: [TripSection]
        var isPresentDetailVC: Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapCell(let indexPath):
            return .concat([
                .just(.setPresentVC(true)),
                .just(.setPresentVC(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setPresentVC(let isPresent):
            state.isPresentDetailVC = isPresent
        }
        
        return state
    }
}

extension TripListReactor {
    
    static func setUpSections() -> [TripSection] {
        
        let data: [listModel] = [
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
            listModel(tripImage: nil, tripTitle: "인천대학교 송도캠퍼스", date: "2021. 10. 19 ~ 2021. 10. 23"),
        ]
        
        return [TripSection.first(data.map { TripSectionItem.item($0) })]
    }
}
