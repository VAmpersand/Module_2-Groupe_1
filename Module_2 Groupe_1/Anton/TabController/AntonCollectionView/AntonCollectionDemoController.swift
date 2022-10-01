//
//  AntonCollectionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by air on 29.09.2022.
//

import UIKit
import SnapKit

final class AntonCollectionDemoController: UIViewController {
    
    private let cellIdentifier = "cellIdentifier"
    private let headerIdentifier = "headerIdentifier"
    private let footerIdentifier = "footerIdentifier"
    
    private lazy var dataSource: [SectionConfig] = [
        SectionConfig(headerColor: .cyan,
                      footerColor: nil,
                      items: [
                        ItemConfig(color: .red, size: .small),
                        ItemConfig(color: .red, size: .small),
                        ItemConfig(color: .red, size: .small),
                        ItemConfig(color: .purple, size: .medium),
                        ItemConfig(color: .red, size: .small),
                        ItemConfig(color: .red, size: .small),
                        ItemConfig(color: .purple, size: .medium),
                        ItemConfig(color: .blue, size: .large),
                      ]),
        SectionConfig(headerColor: .cyan,
                      footerColor: nil,
                      items: [
                        ItemConfig(color: .blue, size: .large),
                              ItemConfig(color: .purple, size: .medium),
                              ItemConfig(color: .red, size: .small),
                              ItemConfig(color: .red, size: .small),
                              ItemConfig(color: .purple, size: .medium),
                              ItemConfig(color: .red, size: .small),
                              ItemConfig(color: .red, size: .small),
                              ItemConfig(color: .red, size: .small),]),
        SectionConfig(headerColor: nil,
                      footerColor: .green,
                      items: []),
    ]
                                       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 111, height: 111)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.footerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: headerIdentifier
        )
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: footerIdentifier
        )
        
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
        dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
}

// MARK: UICollectionViewDelegate
extension AntonCollectionDemoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = dataSource[indexPath.section].items[indexPath.row].color
        print(indexPath)
        return cell
    }
    
    internal func collectionView(_ collectionView: UICollectionView,
                                layout collectionViewLayout: UICollectionViewLayout,
                                sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let height = (screenWidth - 20 * 2 - 20 * 2) / 3
        let width = screenWidth - 20 * 2 - height - 20
       
        switch dataSource[indexPath.section].items[indexPath.row].size {
        case .small: return CGSize(width: height, height: height)
        case .medium: return CGSize(width: width, height: height)
        case .large: return CGSize(width: screenWidth, height: height)
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let indentifier = kind == UICollectionView.elementKindSectionHeader ? headerIdentifier : footerIdentifier
 
        let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: indentifier, for: indexPath
        )
        
        let headerColor = dataSource[indexPath.section].headerColor
        let footerColor = dataSource[indexPath.section].footerColor

        view.backgroundColor = indentifier == headerIdentifier
        ? dataSource[indexPath.section].headerColor
        : dataSource[indexPath.section].footerColor
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width,
               height: dataSource[section].headerColor == nil ? 0 : 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width,
               height: dataSource[section].footerColor == nil ? 0 : 60)
    }
}

struct SectionConfig {
    let headerColor: UIColor?
    let footerColor: UIColor?
    let items: [ItemConfig]
}

struct ItemConfig {
    let color: UIColor
    let size: FrameSize
}

enum FrameSize {
case small, medium, large
}

