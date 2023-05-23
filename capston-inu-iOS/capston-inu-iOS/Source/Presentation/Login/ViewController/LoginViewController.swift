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
import GoogleSignIn

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
            .map { Reactor.Action.didTapGoogleLoginButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        // google 로그인 화면으로 이동
        reactor.state
            .map { $0.googleLogin }
            .distinctUntilChanged()
            .filter { $0 }
            .map { _ in }
            .bind { [weak self] in
                self!.googleLoginButtonDidTap()
            }
            .disposed(by: disposeBag)
            
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
    
    func googleLoginButtonDidTap() {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            guard error == nil, let result = result else { return }
            
            let token = result.user.accessToken.tokenString

            API.googleLogin(token)
                .catch { _ in .empty()}
                .map { _ in } // xAutoToken 가져와서 keyChain에 넣기
                .bind { [weak self] in
                    self!.goToMainViewController()
                }
                .disposed(by: self.disposeBag)
        }
    }
}
