//
//  TripDetailReactor.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import ReactorKit

class TripDetailReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case viewDidLoad
    }
    
    enum Mutation {
        case setUpSections([TripDetailSection])
    }
    
    struct State {
        var sections: [TripDetailSection] = []
    }
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            return TripDetailReactor.reqeustTripDetailData()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setUpSections(let sections):
            newState.sections = sections
        }
        
        return newState
    }
}

extension TripDetailReactor {
    
    static func reqeustTripDetailData() -> Observable<Mutation> {
        
        var sections = [TripDetailSection]()
        
        let tripInfoSection = TripDetailSection.tripSection([TripDetailSectionItem.tripCell(TripInfoCellReactor())], "우리들의 강릉여행")
        
        sections.append(tripInfoSection)
        
        let people = ["!!!", "@@@", "###", "$$$"]
        
        let peopleSection = TripDetailSection.peopleSection(people.map { _ in TripDetailSectionItem.peopleCell(TripPeopleCellReactor())
        })
        
        sections.append(peopleSection)
        
        let commentSection = TripDetailSection.commentSection(people.map { _ in
            TripDetailSectionItem.commentCell(TripCommentCellReactor())
        })
        
        sections.append(commentSection)
                
        return .just(.setUpSections(sections))
    }
}
