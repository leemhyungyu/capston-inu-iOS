//
//  TripDetailViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

class TripDetailViewController: UIViewController, View {

    typealias Reactor = TripDetailReactor
    var disposeBag = DisposeBag()
    
    // MARK: - UI Component
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("TripDetailViewController - deinit")
    }
}

extension TripDetailViewController {
    
    // MARK: - bind
    
    func bind(reactor: TripDetailReactor) {
        // MARK: - Action
        
        // MARK: - State
    }
}
