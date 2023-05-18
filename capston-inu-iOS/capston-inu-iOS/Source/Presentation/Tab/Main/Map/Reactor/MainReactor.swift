//
//  MainReactor.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import ReactorKit

class MainReactor: Reactor {

    var initialState: State
    
    enum Action {
        case didTapListButton
    }
    
    enum Mutation {
        case isPresentListVC(Bool)
    }
    
    init() {
        initialState = State()
    }
    
    struct State {
        var isPresentListVC: Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapListButton:
            return .concat([
                .just(.isPresentListVC(true)),
                .just(.isPresentListVC(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .isPresentListVC(let isPresent):
            state.isPresentListVC = isPresent
        }
        
        return state
    }
}

