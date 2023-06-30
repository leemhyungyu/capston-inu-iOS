//
//  PlanDateVIew.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/06/30.
//

import UIKit
import SnapKit

class PlanDateView: UIView {
    
    // MARK: - UI Component
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "날짜"
        label.textColor = .black
        return label
    }()
//
//    lazy var calendarImageView: UIImageView = {
//
//        let imageView = UIImageView()
//
//        imageView.image = UIImage(named: "calendar")
//
//        return imageView
//    }()
    
    lazy var startDatePicker: UIDatePicker = {
       
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.calendar = .current
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.backgroundColor = .white
        
        return datePicker
    }()
    
    lazy var endDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.calendar = .current
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.backgroundColor = .white
        
        return datePicker
    }()
    
    let waveLabel: UILabel = {
       
        let label = UILabel()
        label.text = "~"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlanDateView {
    
    func configureUI() {
        self.backgroundColor = .white
        
        [   titleLabel,
            startDatePicker,
            endDatePicker,
            waveLabel   ]   .forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(20)
        }
        
        startDatePicker.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
        }

        waveLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(startDatePicker)
        }
        
        endDatePicker.snp.makeConstraints {
            $0.top.equalTo(startDatePicker)
            $0.trailing.equalToSuperview().inset(10)
        }
        
//        calendarImageView.snp.makeConstraints {
//            $0.top.equalTo(startDatePicker)
//            $0.leading.equalToSuperview().inset(5)
//        }
    }
}
