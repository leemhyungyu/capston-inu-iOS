//
//  TripDetailHeaderView.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import UIKit
import SnapKit

class TripDetailHeaderView: UICollectionReusableView {
    
    static let identifier = "TripDetailHeaderView"
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TripDetailHeaderView {
    
    func configureUI() {
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func updateHeaderTitle(_ title: String) {
        label.text = title
    }
}
