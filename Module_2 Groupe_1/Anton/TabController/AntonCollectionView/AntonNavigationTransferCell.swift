//
//  AntonNavigationTransferCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 02.10.2022.
//

import UIKit
import SnapKit
import WebKit

final class AntonNavigationTransferCell: UICollectionViewCell {
    
    static var id: String = "AntonNavigationTransferCell"
    static var size = CGSize(width: UIScreen.main.bounds.width, height: 115)

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
    
    private var items: [AntonNavigationCell.CellConfig] = []

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

    func configure(with items: [AntonNavigationCell.CellConfig]) {
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
            $0.height.equalTo(75)
        }
    }

    private func configureAppearance() {
        backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AntonNavigationCell.self, forCellWithReuseIdentifier: AntonNavigationCell.id)
    }
}

// MARK: - UICollectionViewDataSource
extension AntonNavigationTransferCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
}

// MARK: - UICollectionViewDelegate
extension AntonNavigationTransferCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AntonNavigationCell.id,
                                                            for: indexPath) as? AntonNavigationCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        AntonNavigationCell.size
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
