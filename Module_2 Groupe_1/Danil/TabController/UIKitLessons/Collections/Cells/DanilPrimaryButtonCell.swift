//
//  DanilPrimaryButtonCell.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.10.2022.
//

import UIKit

final class DanilPrimaryButtonCell: UICollectionViewCell {
    
    static let id = "primaryButtonId"
    static let size = CGSize(width: UIScreen.main.bounds.width, height: 44)
    
    private let mainContainer = UIView(backgroundColor: .clear)
    private let primaryButton = DanilPrimaryButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(mainContainer)
        
        mainContainer.addSubview(primaryButton)
    }
    
    private func addConstraints() {
        mainContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview()
        }
    
        primaryButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.greaterThanOrEqualTo(130)
        }
    }
    
    func configure(with item: DanilPrimaryButtonCell.CellConfig) {
        primaryButton.buttonLabel.text = item.title
    }
}
