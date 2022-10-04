//
//  DanilCollectionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.09.2022.
//

import UIKit

final class DanilCollectionDemoController: UIViewController {
    
    private let viewModel = DanilViewModel()
    private let backgroundImageView = UIImageView(image: UIImage(named: "danilTopImage"))
    //private let orderMainHeader = DanilOrderMainHeader()
    
    private let collectionView: UICollectionView = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        return collectionView
    }()
    
    private let mainContainer: UIView = {
        let view = UIView(backgroundColor: .white)
        view.layer.cornerRadius = 25
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //orderMainHeader.configure(with: viewModel.dataSource.mainHeaderConfig)
        collectionView.register(DanilOrderMainHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: DanilOrderMainHeader.id)
        collectionView.register(DanilMainOrderInfoCell.self, forCellWithReuseIdentifier: DanilMainOrderInfoCell.id)
        collectionView.register(DanilOrderPositionCell.self, forCellWithReuseIdentifier: DanilOrderPositionCell.id)
        collectionView.register(DanilEmptyCell.self, forCellWithReuseIdentifier: DanilEmptyCell.id)
        collectionView.register(DanilPromoCell.self, forCellWithReuseIdentifier: DanilPromoCell.id)
        collectionView.register(DanilTotalPriceCell.self, forCellWithReuseIdentifier: DanilTotalPriceCell.id)
        collectionView.register(DanilPrimaryButtonCell.self, forCellWithReuseIdentifier: DanilPrimaryButtonCell.id)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShowHandler(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHideHandler)
                                               , name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainContainer)
        
        //mainContainer.addSubview(orderMainHeader)
        mainContainer.addSubview(collectionView)
    }
    
    private func addConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        mainContainer.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(140)
        }
        
        //        orderMainHeader.snp.makeConstraints {
        //            $0.top.equalToSuperview().offset(45)
        //            $0.leading.trailing.equalToSuperview().inset(30)
        //        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: UICollectionViewDataSource
extension DanilCollectionDemoController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.dataSource.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSource.sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header: UICollectionReusableView
        let itemHeader = viewModel.dataSource.sections[indexPath.section].header
        
        switch itemHeader {
        case .main(let item):
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: DanilOrderMainHeader.id,
                                                                     for: indexPath)
            (header as? DanilOrderMainHeader)?.configure(with: item)
        default:
            header = UICollectionReusableView()
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        let item = viewModel.dataSource.sections[indexPath.section].items[indexPath.item]
        
        switch item {
        case .empty:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DanilEmptyCell.id, for: indexPath)
        case .address(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DanilMainOrderInfoCell.id, for: indexPath)
            (cell as? DanilMainOrderInfoCell)?.configure(with: item)
        case .position(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DanilOrderPositionCell.id, for: indexPath)
            (cell as? DanilOrderPositionCell)?.configure(with: item)
        case .promo:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DanilPromoCell.id, for: indexPath)
        case .totalPrice(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DanilTotalPriceCell.id, for: indexPath)
            (cell as? DanilTotalPriceCell)?.configure(with: item)
        case .primaryButton(let item):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DanilPrimaryButtonCell.id, for: indexPath)
            (cell as? DanilPrimaryButtonCell)?.configure(with: item)
        default:
            cell = UICollectionViewCell()
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension DanilCollectionDemoController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let itemHeader = viewModel.dataSource.sections[section].header
        
        switch itemHeader {
        case .main: return DanilOrderMainHeader.size
        default: return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.dataSource.sections[indexPath.section].items[indexPath.item]
        switch item {
        case .address: return DanilMainOrderInfoCell.size
        case .position: return DanilOrderPositionCell.size
        case .empty(let height): return DanilEmptyCell.size(with: height)
        case .promo: return DanilPromoCell.size
        case .totalPrice: return DanilTotalPriceCell.size
        case .primaryButton: return DanilPrimaryButtonCell.size
        default: return .zero
        }
    }
}

@objc extension DanilCollectionDemoController {
    @objc func keyboardWillShowHandler(_ notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            collectionView.contentInset.bottom = keyboardHeight
        }
    }
    
    @objc func keyboardWillHideHandler() {
        collectionView.contentInset.bottom = 0
    }
}
