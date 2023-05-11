//
//  LoginViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

class LoginViewController: UIViewController, View {

    typealias Reactor = LoginReactor
    var disposeBag = DisposeBag()
    
    // MARK: - UI Component
    lazy var googleLoginButton: UIButton = {
       
        let button = UIButton()
        
        button.setUpLoginButton(LoginType.google)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension LoginViewController {
    
    // MARK: - bind
    
    func bind(reactor: LoginReactor) {
        
        // MARK: - action
        
        // googleLoginButton 클릭
        googleLoginButton.rx.tap
            .do(onNext: { print("googleLoginButton - clicked")})
            .map { Reactor.Action.didTapGoogleLoginButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        // 일단은 로그인 버튼 클릭시 메인 VC으로 이동
        reactor.state
            .map { $0.goToMainVC }
            .distinctUntilChanged()
            .filter { $0 }
            .bind(onNext: {
                // MainVC으로 이동
            })
            
    }
    
    // MARK: - Configure
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(googleLoginButton)
        
        googleLoginButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
}
