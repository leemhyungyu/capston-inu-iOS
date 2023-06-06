//
//  CalendarViewController.swift
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

class CalendarViewController: UIViewController, View {

    // MARK: - Properties
    lazy var reactor = CalendarReactor()
    var disposeBag: DisposeBag = DisposeBag()
    var dataSource: RxTableViewSectionedReloadDataSource<CalendarSection>!
    // MARK: - UI Component
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.identifier)
        return tableView
    }()
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(reactor: reactor)
        configureUI()
    }
}

extension CalendarViewController {
    
    // MARK: - bind
    func bind(reactor: CalendarReactor) {
        configureDataSource()
        
        // MARK: - action
        
        Observable.just(())
            .map { Reactor.Action.viewDidLoad }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // MARK: - state
        
        reactor.state
            .map { $0.section }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
    
    // MAKR: - configure
    
    func configureUI() {
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configureDataSource() {
        
        dataSource = RxTableViewSectionedReloadDataSource(configureCell: { _, tableView, indexPath, item in
            switch item {
            case .calendarCell(let trip):
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as? CalendarTableViewCell else { return UITableViewCell() }
                
                cell.updateCell(trip)
                
                return cell
            }
        })
    }
}

// MARK: - UITableViewDelegate
extension CalendarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
