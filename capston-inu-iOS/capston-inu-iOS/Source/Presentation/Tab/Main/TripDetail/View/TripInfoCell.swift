//
//  TripInfoCell.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/18.
//

import UIKit

class TripInfoCell: UICollectionViewCell {
    
    static let identifier = "TripInfoCell"
    
    // MARK: - UI Component
    
    lazy var tripImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 25
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    var departureTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text =  "출발 일자"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    var arrivalTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text =  "도착 일자"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    var departureContentLabel: UILabel = {
        let label = UILabel()
        
        label.text =  "2021.10.19"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    var arrivalContentLabel: UILabel = {
        let label = UILabel()
        
        label.text =  "2021.10.23"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var albumButton: UIButton = {
        let button = UIButton()
        button.setUpTripDetailButton("앨범")
        return button
    }()
    
    lazy var planButton: UIButton = {
        
        let button = UIButton()
            
        button.setUpTripDetailButton("일정")
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TripInfoCell {
    
    func configureUI() {
        layer.cornerRadius = 25
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        
        backgroundColor = .white
        
        [   tripImageView,
            departureTitleLabel,
            arrivalTitleLabel,
            departureContentLabel,
            arrivalContentLabel,
            albumButton,
            planButton
        ]   .forEach { addSubview($0) }
        
        tripImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        departureTitleLabel.snp.makeConstraints {
            $0.top.equalTo(tripImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        arrivalTitleLabel.snp.makeConstraints {
            $0.top.equalTo(departureTitleLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        departureContentLabel.snp.makeConstraints {
            $0.top.equalTo(departureTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(departureTitleLabel)
        }
        
        arrivalContentLabel.snp.makeConstraints {
            $0.top.equalTo(departureContentLabel)
            $0.trailing.equalTo(arrivalTitleLabel)
        }
        
        albumButton.snp.makeConstraints {
            $0.top.equalTo(departureContentLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo((UIScreen.main.bounds.width - 90) / 2)
            $0.height.equalTo(40)
        }
        
        planButton.snp.makeConstraints {
            $0.top.equalTo(albumButton)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo((UIScreen.main.bounds.width - 90) / 2)
            $0.height.equalTo(40)
        }
    }
}

