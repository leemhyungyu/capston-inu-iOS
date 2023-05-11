//
//  TripTableViewCell.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import Foundation
import UIKit
import SnapKit

class TripTableViewCell: UITableViewCell {
        
    // MARK - Identifier
    
    static let identifier = "TripTableViewCell"

    // MARK: - UI Component
    
    lazy var tripImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    var tripTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .blue
        
        return label
    }()
    
    var dateLable: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        
        return label
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TripTableViewCell {
    
    // MARK: - Configure
    
    func configureUI() {
        [
            tripImage,
            tripTitle,
            dateLable
        ]   .forEach { addSubview($0) }

        tripImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        tripTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(tripImage.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        dateLable.snp.makeConstraints {
            $0.top.equalTo(tripTitle.snp.bottom).offset(5)
            $0.leading.equalTo(tripTitle)
            $0.trailing.equalTo(tripTitle)
        }
    }
    
    func updateCell(_ data: listModel) {
        
        tripTitle.text = data.tripTitle
        dateLable.text = data.date
    }
}
