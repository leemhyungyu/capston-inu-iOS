//
//  CalendarTableViewCell.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/06.
//

import Foundation
import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    // MARK: - identifier
    static let identifier = "CalendarTableViewCell"
    
    // MARK: - UI Component
    
    lazy var tripImageView: UIImageView = {
      
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray2
        
        return imageView
    }()
    
    var tripTitleLabel: UILabel = {
       
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var tripStartDateLabel: UILabel = {
       
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray2
        return label
    }()
    
    var tripEndDateLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarTableViewCell {
    
    func configureUI() {
        
        [   tripImageView,
            tripTitleLabel,
            tripStartDateLabel,
            tripEndDateLabel
        ]   .forEach { addSubview($0) }
        
        tripImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        tripTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(tripImageView.snp.trailing).offset(25)
            $0.top.equalToSuperview().inset(20)
        }
        
        tripStartDateLabel.snp.makeConstraints {
            $0.leading.equalTo(tripTitleLabel)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        tripEndDateLabel.snp.makeConstraints {
            $0.leading.equalTo(tripStartDateLabel.snp.trailing).offset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    func updateCell(_ data: TripList) {
        tripTitleLabel.text = data.title
        tripStartDateLabel.text = data.startDate
        tripEndDateLabel.text = data.endDate
    }
}
