//
//  LoginReactor.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import Foundation
import ReactorKit

class LoginReactor: Reactor {
    var initialState: State
    
    enum Action {
        case didTapGoogleLoginButton
    }
    
    enum Mutation {
        case goToMainVC(Bool)
    }
    
    init() {
        initialState = State()
    }
    
    struct State {
        var goToMainVC: Bool = false
        var isLogin: Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapGoogleLoginButton:
            return .concat([
                .just(.goToMainVC(true)),
                .just(.goToMainVC(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .goToMainVC(let isPresent):
            state.goToMainVC = isPresent
        }
        
        return state
    }
}
