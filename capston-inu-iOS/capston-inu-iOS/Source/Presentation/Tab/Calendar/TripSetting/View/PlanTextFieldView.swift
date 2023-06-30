//
//  PlanTextFieldView.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/30.
//

import UIKit
import SnapKit

class PlanTextFieldView: UIView {
    
    
    // MARK: - UI Component
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var contentTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = .white
        return textField
    }()
    // MARK: - init
    init(_ title: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.contentTextField.placeholder = title + "을 입력해주세요."
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlanTextFieldView {
    
    func configureUI() {
        
        backgroundColor = .white
        
        [   titleLabel,
            contentTextField    ]   .forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.left.equalToSuperview().inset(15)
            $0.height.equalTo(20)
        }
        
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(20)
        }
    }
}
