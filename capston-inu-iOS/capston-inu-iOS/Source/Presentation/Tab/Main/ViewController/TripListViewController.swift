//
//  TripListViewController.swift
//  capston-inu-iOS
//
//  Created by 임현규 on 2023/05/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit
import RxDataSources

class TripListViewController: UIViewController, View {

    // MARK: - Properties
    
    typealias Reactor = TripListReactor
    var disposeBag = DisposeBag()
    var dataSource: RxTableViewSectionedReloadDataSource<TripSection>!
    
    // MARK: - UI Component
    
    lazy var tableView: UITableView = {
       
        let tableView = UITableView(frame: .zero, style: .plain)
            
        tableView.register(TripTableViewCell.self, forCellReuseIdentifier: TripTableViewCell.identifier)
        
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
       
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "장소 검색"
        return searchBar
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension TripListViewController {
    
    // MARK: - bind
    
    func bind(reactor: TripListReactor) {
        configureDataSource()
        
        // MARK: - action
        
        // Cell 클릭
        tableView.rx.itemSelected
            .map { Reactor.Action.didTapCell($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // MARK: - state
        
        // tableView 바인딩
        reactor.state
            .map { $0.sections }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        // Cell 클릭시 여행 상세화면으로 이동
        reactor.state
            .map { $0.isPresentDetailVC }
            .distinctUntilChanged()
            .filter { $0 }
            .map { _ in }
            .bind(onNext: presentTripDetailViewController )
            .disposed(by: disposeBag)
    }
    
    // MARK: - Configure
    
    func configureUI() {
        
        [
            searchBar,
            tableView
        ]   .forEach { view.addSubview($0) }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).inset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func configureDataSource() {
        
        dataSource = RxTableViewSectionedReloadDataSource(configureCell: { _, tableView, indexPath, item in
            switch item {
            case .item(_):
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as? TripTableViewCell else { return UITableViewCell() }
                
                return cell
            }
        })
    }
}


// MARK: - UITableViewDelegate

extension TripListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
