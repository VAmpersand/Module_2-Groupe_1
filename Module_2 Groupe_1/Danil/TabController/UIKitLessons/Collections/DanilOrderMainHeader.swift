//
//  DanilOrderMainHeader.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.09.2022.
//

import UIKit

final class DanilOrderMainHeader: UIView {
    
    private let cartImageView = UIImageView(image: UIImage(named: "danilCart"))
    private let titleLabel = UILabel(font: .getCeraProBold(with: 25))
    private let amountOfItemsLabel = UILabel(font: .getCeraProMedium(with: 14))
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "danilCloseButton"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private var amountOfItems: UInt = 0 {
        didSet {
            amountOfItemsLabel.text = String(amountOfItems)
        }
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        stackView.alignment = .center
        return stackView
    }()
    
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
        [
            titleLabel,
            cartImageView,
            amountOfItemsLabel,
        ].forEach(stackView.addArrangedSubview)
        addSubview(stackView)
        addSubview(closeButton)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(155)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints {
            $0.size.equalTo(11)
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview()
        }
    }
    
    func configure(with headerConfig: DanilViewModel.MainHeaderConfig) {
        titleLabel.text = headerConfig.title
        amountOfItems = headerConfig.itemsInCart
    }
}
