//
//  AntonCollectionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by air on 29.09.2022.
//

import UIKit
import SnapKit

final class AntonCollectionDemoController: UIViewController {
    
    private let viewModel = AntonViewModel()
   
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 20, right: 0)

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AntonBannerCell.self, forCellWithReuseIdentifier: AntonBannerCell.id)
        collectionView.register(AntonNavigationCell.self, forCellWithReuseIdentifier: AntonNavigationCell.id)
        collectionView.register(AntonHeaderCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AntonHeaderCell.id)

        view.addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.bottom.equalToSuperview()
        }
    }
}

// MARK: UICollectionViewDataSource
extension AntonCollectionDemoController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.dataSource[section].items.count
    }
}

// MARK: UICollectionViewDelegate
extension AntonCollectionDemoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        let item = viewModel.dataSource[indexPath.section].items[indexPath.row]
        
        switch item {
        case .banner(let items):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonBannerCell.id,
                                                      for: indexPath)
            (cell as? AntonBannerCell)?.configure(with: items)
        case .navigation(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonNavigationCell.id,
                                                      for: indexPath)
            (cell as? AntonNavigationCell)?.configure(with: item)
        default: cell = UICollectionViewCell()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                                layout collectionViewLayout: UICollectionViewLayout,
                                sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.dataSource[indexPath.section].items[indexPath.row]
        switch item {
        case .banner: return AntonBannerCell.size
        case .navigation: return AntonNavigationCell.size
        default: return .zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: AntonHeaderCell.id,
                                                                   for: indexPath)
        
        if let config = viewModel.dataSource[indexPath.section].headerConfig {
            (view as? AntonHeaderCell)?.configure(with: config)
            view.backgroundColor = .clear
        }
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        if viewModel.dataSource[section].headerConfig != nil {
            return  AntonHeaderCell.size
        }
        
        return .zero
    }
}

