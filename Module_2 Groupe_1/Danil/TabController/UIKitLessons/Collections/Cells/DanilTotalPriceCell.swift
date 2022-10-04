//
//  DanilTotalPriceCell.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.10.2022.
//

import UIKit

extension DanilTotalPriceCell {
    struct CellConfig {
        let deliveryPrice: UInt
        let subtotalPrice: UInt
    }
}

final class DanilTotalPriceCell: UICollectionViewCell {
    
    static let id = "totalPriceId"
    static let size = CGSize(width: UIScreen.main.bounds.width, height: 78)
    
    private var deliveryPrice: UInt = 0 {
        didSet {
            deliveryPriceLabel.text = "₹\(deliveryPrice)"
        }
    }
    
    private var subtotalPrice: UInt = 0 {
        didSet {
            subtotalPriceLabel.text = "₹\(subtotalPrice)"
        }
    }
    
    private var totalPrice: UInt {
        return deliveryPrice + subtotalPrice
    }
    
    private let subtotalLabel = UILabel(font: .getPoppinsSemiBold(with: 14), text: "Subtotal", numberOfLines: 1)
    private let subtotalPriceLabel = UILabel(font: .getMetropolisMedium(with: 14), text: "", numberOfLines: 1)
    private let deliveryLabel = UILabel(font: .getPoppinsSemiBold(with: 14), text: "Delivery", numberOfLines: 1)
    private let deliveryPriceLabel = UILabel(font: .getMetropolisMedium(with: 14), text: "", numberOfLines: 1)
    private let totalLabel = UILabel(font: .getPoppinsSemiBold(with: 16), text: "Total", numberOfLines: 1)
    private let totalPriceLabel = UILabel(font: .getPoppinsSemiBold(with: 20), text: "", numberOfLines: 1)
    
    private let mainContainer: UIView = {
        let view = UIView(backgroundColor: .white)
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 7
        return view
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
            subtotalLabel,
            subtotalPriceLabel,
            deliveryLabel,
            deliveryPriceLabel,
            totalLabel,
            totalPriceLabel
        ].forEach(mainContainer.addSubview)
    }
    
    private func addConstraints() {
        mainContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview()
        }
        
        subtotalLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalToSuperview().offset(6)
        }
        
        subtotalPriceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.centerY.equalTo(subtotalLabel)
        }
        
        deliveryLabel.snp.makeConstraints {
            $0.leading.equalTo(subtotalLabel)
            $0.top.equalTo(subtotalLabel.snp.bottom).offset(2)
        }
        
        deliveryPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(subtotalPriceLabel)
            $0.centerY.equalTo(deliveryLabel)
        }
        
        totalLabel.snp.makeConstraints {
            $0.leading.equalTo(subtotalLabel)
            $0.top.equalTo(deliveryLabel.snp.bottom).offset(3)
        }
        
        totalPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(subtotalPriceLabel)
            $0.centerY.equalTo(totalLabel)
        }
    }
    
    func configure(with config: DanilTotalPriceCell.CellConfig) {
        deliveryPrice = config.deliveryPrice
        subtotalPrice = config.subtotalPrice
        totalPriceLabel.text = "₹\(totalPrice)"
    }
}
