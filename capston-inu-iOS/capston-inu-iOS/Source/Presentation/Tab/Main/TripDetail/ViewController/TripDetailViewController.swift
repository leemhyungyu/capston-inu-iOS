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
import RxDataSources

class TripDetailViewController: UIViewController, View {

    typealias Reactor = TripDetailReactor
    typealias TripDataSource = RxCollectionViewSectionedReloadDataSource<TripDetailSection>

    // MARK: - Properties
    
    var disposeBag = DisposeBag()

    lazy var dataSource = TripDataSource(configureCell: { _, collectionView, indexPath, item -> UICollectionViewCell in
        
        switch item {
        case .tripCell:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripInfoCell.identifier, for: indexPath) as? TripInfoCell else { return UICollectionViewCell() }
            
            return cell
        case .peopleCell:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripPeopleCell.identifier, for: indexPath) as? TripPeopleCell else { return UICollectionViewCell() }
            
            return cell
        case .commentCell:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripCommentCell.identifier, for: indexPath) as? TripCommentCell else { return UICollectionViewCell() }
                
            return cell
        }
    },
    configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
        
        let sectionItem = dataSource[indexPath.section]
        
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: TripDetailHeaderView.identifier,
            for: indexPath) as? TripDetailHeaderView else { return UICollectionReusableView() }
        
        header.updateHeaderTitle(sectionItem.headerTitle)
        
        return header
        }
    )
    
    // MARK: - UI Component
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.setUpCollectionViewLayout())
        

        collectionView.register(TripInfoCell.self, forCellWithReuseIdentifier: TripInfoCell.identifier)
        collectionView.register(TripPeopleCell.self, forCellWithReuseIdentifier: TripPeopleCell.identifier)
        collectionView.register(TripCommentCell.self, forCellWithReuseIdentifier: TripCommentCell.identifier)
        
        collectionView.register(TripDetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TripDetailHeaderView.identifier)
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    deinit {
        print("TripDetailViewController - deinit")
    }
}

extension TripDetailViewController {
    
    // MARK: - bind
    
    func bind(reactor: TripDetailReactor) {
        // MARK: - Action
        
        Observable.just(())
            .map { Reactor.Action.viewDidLoad }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // MARK: - State
        
        reactor.state
            .map { $0.sections }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    
    func configureUI() {
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setUpCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            
            let sectionType = self?.dataSource[sectionIndex]

            return self?.createCollectionViewLayout(sectionType: sectionType!)

        }
    }
    
    func createCollectionViewLayout(sectionType: TripDetailSection) -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: sectionType.cellSize)
        
        var group = NSCollectionLayoutGroup.horizontal(layoutSize: sectionType.cellSize,
                                                       subitems: [item])
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(50)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading)
        
        let section = NSCollectionLayoutSection(group: group)
        
        if case .peopleSection(_) = sectionType {
            section.orthogonalScrollingBehavior = .continuous
        }

        section.boundarySupplementaryItems = [ sectionHeader ]
        section.interGroupSpacing = sectionType.spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 70, trailing: 20)
        
        return section
    }
}
