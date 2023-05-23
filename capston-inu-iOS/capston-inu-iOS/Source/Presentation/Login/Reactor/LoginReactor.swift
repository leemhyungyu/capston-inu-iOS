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
        case didCompletedLogin
    }
    
    enum Mutation {
        case setGoogleLogin(Bool)
        case setLoginState(Bool)
    }
    
    init() {
        initialState = State()
    }
    
    struct State {
        var googleLogin: Bool = false
        var isLogin: Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapGoogleLoginButton:
            return .concat([
                .just(.setGoogleLogin(true)),
                .just(.setGoogleLogin(false))
            ])
        case .didCompletedLogin:
            return .just(.setLoginState(true))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .setGoogleLogin(let isGoogle):
            state.googleLogin = isGoogle
            
        case .setLoginState(let isLogin):
            state.isLogin = isLogin
        }
        
        return state
    }
}
