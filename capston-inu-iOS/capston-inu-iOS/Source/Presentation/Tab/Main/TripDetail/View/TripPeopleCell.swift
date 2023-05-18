//
//  TripPeopleCell.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import UIKit

class TripPeopleCell: UICollectionViewCell {
    
    static let identifier = "TripPeopleCell"
    
    lazy var peopleImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 40
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "홍길동"
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

extension TripPeopleCell {
    
    func configureUI() {
        
        [   peopleImageView,
            nameLabel
        ]   .forEach { addSubview($0) }
        
        peopleImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(peopleImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(peopleImageView)
            $0.height.equalTo(20)
        }
    }
}
