//
//  DanilOrderMainHeader.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.09.2022.
//

import UIKit

extension DanilOrderMainHeader {
    struct CellConfig {
        let amountOfItemsInCart: UInt
    }
}

final class DanilOrderMainHeader: UICollectionReusableView {
    
    static let id = "mainHeader"
    static let size = CGSize(width: UIScreen.main.bounds.width, height: 35)
    
    private let mainContainer = UIView(backgroundColor: .clear)
    private let cartImageView = UIImageView(image: UIImage(named: "danilCart"))
    private let titleLabel = UILabel(font: .getCeraProBold(with: 25), text: "Your Order")
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
        addSubview(mainContainer)
        
        [
            titleLabel,
            cartImageView,
            amountOfItemsLabel,
        ].forEach(stackView.addArrangedSubview)
        
        mainContainer.addSubview(stackView)
        mainContainer.addSubview(closeButton)
    }
    
    private func addConstraints() {
        mainContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.verticalEdges.equalToSuperview()
        }
        
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
    
    func configure(with headerConfig: DanilOrderMainHeader.CellConfig) {
        amountOfItems = headerConfig.amountOfItemsInCart
    }
}
