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
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        view.showsVerticalScrollIndicator = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AntonBannerCell.self, forCellWithReuseIdentifier: AntonBannerCell.id)
        collectionView.register(AntonNavigationMenuCell.self, forCellWithReuseIdentifier: AntonNavigationMenuCell.id)
        collectionView.register(AntonEmptyCell.self, forCellWithReuseIdentifier: AntonEmptyCell.id)
        collectionView.register(AntonPromoCodeCell.self, forCellWithReuseIdentifier: AntonPromoCodeCell.id)
        collectionView.register(AntonPriceCell.self, forCellWithReuseIdentifier: AntonPriceCell.id)
        collectionView.register(AntonButtonSetCell.self, forCellWithReuseIdentifier: AntonButtonSetCell.id)
        
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
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonNavigationMenuCell.id,
                                                      for: indexPath)
            (cell as? AntonNavigationMenuCell)?.configure(with: item)
        case .empty:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonEmptyCell.id,
                                                      for: indexPath)
        case .promoCode:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonPromoCodeCell.id,                                                                           for: indexPath)
        case .shoppingCart(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonPriceCell.id,
                                                      for: indexPath)
            (cell as? AntonPriceCell)?.configure(with: item)
        case .buttons(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonButtonSetCell.id,
                                                      for: indexPath)
            (cell as? AntonButtonSetCell)?.configure(with: item)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                                layout collectionViewLayout: UICollectionViewLayout,
                                sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.dataSource[indexPath.section].items[indexPath.row]
       
        switch item {
        case .banner: return AntonBannerCell.size
        case .navigation: return AntonNavigationMenuCell.size
        case .empty: return AntonEmptyCell.size(width: 15)
        case .promoCode: return AntonPromoCodeCell.size
        case .shoppingCart: return AntonPriceCell.size
        case .buttons: return AntonButtonSetCell.size
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

