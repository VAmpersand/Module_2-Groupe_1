//
//  DanilCollectionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 27.09.2022.
//

import UIKit

struct SectionConfig {
    let headerColor: UIColor
    let footerColor: UIColor?
    let items: [ItemConfig]
}

struct ItemConfig {
    let itemColor: UIColor
    let itemWidth: CGFloat
}

final class DanilCollectionDemoController: UIViewController {
    
    private let cellId = "cellId"
    private let headerId = "headerId"
    private let footerId = "footerId"
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let dataSource: [SectionConfig] = [
        .init(headerColor: Constants.CollectionDemoColor.header, footerColor: nil, items: [
            .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
            .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
            .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
            .init(itemColor: Constants.CollectionDemoColor.mediumItem, itemWidth: Constants.CollectionDemoWidth.medium),
            .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
            .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
            .init(itemColor: Constants.CollectionDemoColor.mediumItem, itemWidth: Constants.CollectionDemoWidth.medium),
            .init(itemColor: Constants.CollectionDemoColor.largeItem, itemWidth: Constants.CollectionDemoWidth.large),
        ]),
        .init(
            headerColor: Constants.CollectionDemoColor.header,
            footerColor: Constants.CollectionDemoColor.footer,
            items: [
                .init(itemColor: Constants.CollectionDemoColor.largeItem, itemWidth: Constants.CollectionDemoWidth.large),
                .init(itemColor: Constants.CollectionDemoColor.mediumItem, itemWidth: Constants.CollectionDemoWidth.medium),
                .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
                .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
                .init(itemColor: Constants.CollectionDemoColor.mediumItem, itemWidth: Constants.CollectionDemoWidth.medium),
                .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
                .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
                .init(itemColor: Constants.CollectionDemoColor.smallItem, itemWidth: Constants.CollectionDemoWidth.small),
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: footerId)
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func addConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(110)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: UICollectionViewDataSource
extension DanilCollectionDemoController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = dataSource[indexPath.section].items[indexPath.item].itemColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let identifier = kind == UICollectionView.elementKindSectionHeader ? headerId : footerId
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: identifier,
                                                                           for: indexPath)
        reusableView.backgroundColor = identifier == headerId ? Constants.CollectionDemoColor.header
        : Constants.CollectionDemoColor.footer
        return reusableView
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension DanilCollectionDemoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = dataSource[indexPath.section].items[indexPath.item].itemWidth
        return .init(width: width, height: (UIScreen.main.bounds.width - Constants.CollectionDemoOffset.basic * 2
                                            - Constants.CollectionDemoOffset.basic * 2) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: Constants.CollectionDemoOffset.basic, left: Constants.CollectionDemoOffset.basic,
              bottom: Constants.CollectionDemoOffset.basic, right: Constants.CollectionDemoOffset.basic)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.CollectionDemoOffset.basic
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.CollectionDemoOffset.basic
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        Constants.ReusableViewSize.header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let footerColor = dataSource[section].footerColor
        let footerSize = footerColor != nil ?
        Constants.ReusableViewSize.footer : CGSize(width: 0, height: 0)
        return footerSize
    }
}

private extension Constants {
    enum CollectionDemoColor {
        static let header = UIColor(hexString: "#6FE9CC")
        static let footer = UIColor(hexString: "#0DBF0A")
        static let smallItem = UIColor(hexString: "#EE0909")
        static let mediumItem = UIColor(hexString: "#C50CC9")
        static let largeItem = UIColor(hexString: "#0B15F9")
    }
    
    enum CollectionDemoWidth {
        static let screen = UIScreen.main.bounds.width
        static let small = (Constants.CollectionDemoWidth.screen - 21 * 2 - Constants.CollectionDemoOffset.basic * 2) / 3
        static let medium =
        Constants.CollectionDemoWidth.screen - Constants.CollectionDemoOffset.basic * 2 - Constants.CollectionDemoWidth.small - Constants.CollectionDemoOffset.basic
        static let large = Constants.CollectionDemoWidth.screen - Constants.CollectionDemoOffset.basic * 2
    }
    
    enum ReusableViewSize {
        static let header = CGSize(width: Constants.CollectionDemoWidth.screen, height: 50)
        static let footer = CGSize(width: Constants.CollectionDemoWidth.screen, height: 60)
    }
    
    enum CollectionDemoOffset {
        static let basic: CGFloat = 20
    }
}
