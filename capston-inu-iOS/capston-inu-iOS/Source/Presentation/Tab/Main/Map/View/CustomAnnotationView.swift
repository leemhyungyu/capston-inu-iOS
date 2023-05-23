//
//  CustomAnnotationView.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/23.
//

import Foundation
import UIKit
import SnapKit
import MapKit

class CustomAnnotationView: MKAnnotationView {
    
    // MARK: - UI Component
     
    lazy var backgroundView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .red
        view.layer.cornerRadius = 70
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var imageViewBackgroundView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .red
        
        view.layer.cornerRadius = 45
        view.layer.masksToBounds = true
        
        return view
    }()
    
    lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
       
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // 재사용 전 값을 초기화 시켜서 다른 값이 들어가는 것을 방지
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // 크기 바뀐 만큼 마커 이동
    override func layoutSubviews() {
        super.layoutSubviews()
        bounds.size = CGSize(width: 100, height: 100)
        centerOffset = CGPoint(x: 0, y: 50)
    }

    
    // MARK: - init
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomAnnotationView {
    
    // MARK: - configure
    func configureUI() {
        [   backgroundView,
            imageViewBackgroundView
        ]   .forEach { addSubview($0) }
        
        imageViewBackgroundView.addSubview(imageView)
        
        backgroundView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(90)
        }
        
        imageViewBackgroundView.snp.makeConstraints {
            $0.bottom.equalTo(backgroundView).offset(-15)
            $0.centerX.equalTo(backgroundView)
            $0.height.width.equalTo(90)
        }
        
        imageView.snp.makeConstraints {
            $0.bottom.equalTo(backgroundView).offset(-20)
            $0.centerX.equalTo(backgroundView)
            $0.height.width.equalTo(80)
        }
    }
}
