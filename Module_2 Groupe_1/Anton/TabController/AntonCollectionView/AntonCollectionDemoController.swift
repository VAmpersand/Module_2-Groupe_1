//
//  AntonCollectionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by air on 29.09.2022.
//

import UIKit
import SnapKit

final class AntonCollectionDemoController: UIViewController {
    
    private let cellidentifier = "cellidentifier"
    private let indentSize: CGFloat = 20
    
    private let dataSource: [SectionConfig] = [
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
                    ItemConfig(color: .red, size: .small),
                    ItemConfig(color: .red, size: .small),
                    ItemConfig(color: .red, size: .small),
                    ItemConfig(color: .purple, size: .medium),
                    ItemConfig(color: .red, size: .small),
                    ItemConfig(color: .red, size: .small),
                    ItemConfig(color: .purple, size: .medium),
                    ItemConfig(color: .blue, size: .large),
                  ]),
    SectionConfig(headerColor: nil,
                  footerColor: .green,
                  items: [])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 111, height: 111)
        let collectionView = UICollectionView(frame: CGRect .zero, collectionViewLayout: UICollectionViewLayout.init())
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellidentifier)
//        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = UIColor.white
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.footerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 60)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header")
        
        collectionView.register(
            UICollectionView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "footer")
       
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.left.bottom.equalToSuperview()
        }
    }
}

// создается однажды при создании коллекции
// MARK: UICollectionViewDataSource
extension AntonCollectionDemoController: UICollectionViewDataSource {
// сколько секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }

    // сколько единиц
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
}

// MARK: UICollectionViewDelegate
extension AntonCollectionDemoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath)
        cell.backgroundColor = dataSource[indexPath.section].items[indexPath.row].color
        print(indexPath)
        return cell
    }
    private func collectionView(_ collectionView: UICollectionView,
                                layout cell: UICollectionViewCell,
                                sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let height = (screenWidth - 20 * 2) / 3
        let width = screenWidth - height - indentSize

        switch dataSource[indexPath.section].items[indexPath.row].size {

        case .small: return CGSize(width: height, height: height)
        case .medium: return CGSize(width: width, height: height)
        case .large: return CGSize(width: screenWidth, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let indentifier = kind == UICollectionView.elementKindSectionHeader ? "header" : "footer"
 
        let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: indentifier, for: indexPath
        )
        
        let headerColor = dataSource[indexPath.section].headerColor
        let footerColor = dataSource[indexPath.section].footerColor

        view.backgroundColor = indentifier == "header"
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
