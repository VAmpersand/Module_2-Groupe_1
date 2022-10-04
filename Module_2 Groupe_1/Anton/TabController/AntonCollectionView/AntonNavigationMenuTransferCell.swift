//
//  AntonNavigationMenuTransferCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 02.10.2022.
//

import UIKit
import SnapKit

final class AntonNavigationMenuTransferCell: UICollectionViewCell {
    
    static var id: String = "AntonNavigationMenuTransferCell"
    static var size = CGSize(width: UIScreen.main.bounds.width, height: 104)

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private var items: [AntonNavigationMenuCell.CellConfig] = []

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        addConstraints()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)

        addSubviews()
        addConstraints()
        configureAppearance()
    }

    func configure(with items: [AntonNavigationMenuCell.CellConfig]) {
        self.items = items
        collectionView.reloadData()
    }

    private func addSubviews() {
       addSubview(collectionView)
    }

    private func addConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(240)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(72)
        }
    }

    private func configureAppearance() {
        backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AntonNavigationMenuCell.self, forCellWithReuseIdentifier: AntonNavigationMenuCell.id)
    }
}

// MARK: - UICollectionViewDataSource
extension AntonNavigationMenuTransferCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
}

// MARK: - UICollectionViewDelegate
extension AntonNavigationMenuTransferCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonNavigationMenuCell.id,
                                                            for: indexPath) as? AntonNavigationMenuCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        AntonNavigationMenuCell.size
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
