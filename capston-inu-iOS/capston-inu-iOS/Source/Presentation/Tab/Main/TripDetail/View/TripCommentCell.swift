//
//  TripCommentCell.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import UIKit

class TripCommentCell: UICollectionViewCell {
    
    static let identifier = "TripCommentCell"
    
    lazy var peopleImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 25
        
        return imageView
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.text = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        label.numberOfLines = 0
        
        return label
    }()
    
    let labelSubView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TripCommentCell {
    
    func configureUI() {
        
        [   peopleImageView,
            labelSubView
        ]   .forEach { addSubview($0) }
        
        labelSubView.addSubview(label)
        
        peopleImageView.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        
        labelSubView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width - 120)
        }
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
