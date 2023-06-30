//
//  CalendarReactor.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/06.
//

import Foundation
import ReactorKit

class CalendarReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case viewDidLoad
        case deleteItem(IndexPath)
        case didTapPlusButton
    }
    
    enum Mutation {
        case setUpSection([CalendarSection])
        case setPresentPlanVC(Bool)
    }
    
    struct State {
        var section: [CalendarSection] = []
        var isPresentPlanVC: Bool = false
    }
    
    init() {
        initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            return CalendarReactor.setUpSections()
            
        case .deleteItem(let indexPath):
            return .empty()
            
        case .didTapPlusButton:
            return .concat([
                .just(.setPresentPlanVC(true)),
                .just(.setPresentPlanVC(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setUpSection(let sections):
            newState.section = sections
            
        case .setPresentPlanVC(let isPresent):
            newState.isPresentPlanVC = isPresent
        }
        
        return newState
    }
}

extension CalendarReactor {
    
    static func setUpSections() -> Observable<Mutation> {
        
        var sections = [CalendarSection]()
        
        var data: [TripList] = [
            TripList(title: "여행 제목1", startDate: "여행 시작 일자1", endDate: "여행 종료 일자1"),
            TripList(title: "여행 제목2", startDate: "여행 시작 일자2", endDate: "여행 종료 일자2"),
            TripList(title: "여행 제목3", startDate: "여행 시작 일자3", endDate: "여행 종료 일자3"),
            TripList(title: "여행 제목4", startDate: "여행 시작 일자4", endDate: "여행 종료 일자4"),
            TripList(title: "여행 제목5", startDate: "여행 시작 일자5", endDate: "여행 종료 일자5"),
            TripList(title: "여행 제목6", startDate: "여행 시작 일자6", endDate: "여행 종료 일자61")
        ]
        
        data.forEach {
            sections += [CalendarSection.calendarSection([CalendarSectionItem.calendarCell($0)])]
        }
        
        return .just(.setUpSection(sections))
    }
}
