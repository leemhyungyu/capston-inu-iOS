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

class LoginViewController: UIViewController {

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
