//
//  CustomFloatingPanelLayout.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import FloatingPanel

class CustomFloatingPanelLayout: FloatingPanelLayout {
    var position: FloatingPanelPosition = .bottom
    var initialState: FloatingPanelState = .tip
    
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
            return [
                .full: FloatingPanelLayoutAnchor(fractionalInset: 0.9, edge: .bottom, referenceGuide: .superview), // 가장 큰 화면 Layout
                .half: FloatingPanelLayoutAnchor(absoluteInset: 290.0, edge: .bottom, referenceGuide: .superview), // 중간 정도 layout
                .tip: FloatingPanelLayoutAnchor(absoluteInset: 140.0, edge: .bottom, referenceGuide: .superview) // 초기 상태 layout
            ]
        }
}
