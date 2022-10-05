//
//  DanilOrderPositionCell.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 01.10.2022.
//

import UIKit

extension DanilOrderPositionCell {
    struct CellConfig {
        let imageName: String
        let dishName: String
        let restaurantName: String
        let userName: String
        let amount: UInt
        let price: UInt
    }
}

class DanilOrderPositionCell: UICollectionViewCell {
    
    static let id = "orderPositionId"
    static let size = CGSize(width: UIScreen.main.bounds.width, height: 72)
    
    private let mainContainer = UIView(backgroundColor: .clear)
    private let dishLabel = UILabel(font: .getPoppinsSemiBold(with: 14), text: "", numberOfLines: 1)
    private let userLabel = UILabel(font: .getMetropolisMedium(with: 14), text: "", numberOfLines: 1)
    private let priceLabel = UILabel(font: .getMetropolisMedium(with: 14), text: "", numberOfLines: 1)
    
    private let restaurantLabel: UILabel = {
        let label = UILabel(font: .getPoppinsRegular(with: 12), text: "", numberOfLines: 1)
        label.textColor = UIColor(hexString: "#0A191E")
        return label
    }()
    
    private let amountCounter: CustomStepper = {
        let stepper = CustomStepper()
        stepper.minValue = 1
        return stepper
    }()
    
    private let positionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.BorderRadius.low
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addConsraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubviews()
        addConsraints()
    }
    
    private func addSubviews() {
        addSubview(mainContainer)
        
        [
            positionImageView,
            dishLabel,
            restaurantLabel,
            userLabel,
            priceLabel,
            amountCounter
        ].forEach(mainContainer.addSubview)
    }
    
    private func addConsraints() {
        mainContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview()
        }
        
        positionImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(88)
        }
        
        dishLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalTo(positionImageView.snp.trailing).offset(14)
            $0.width.lessThanOrEqualTo(150)
        }
        
        restaurantLabel.snp.makeConstraints {
            $0.leading.equalTo(dishLabel)
            $0.top.equalTo(dishLabel.snp.bottom).inset(4)
            $0.width.equalTo(dishLabel)
        }
        
        userLabel.snp.makeConstraints {
            $0.top.equalTo(restaurantLabel.snp.bottom).offset(3)
            $0.leading.equalTo(restaurantLabel)
            $0.width.equalTo(restaurantLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(3)
            $0.centerY.equalToSuperview()
        }
        
        amountCounter.snp.makeConstraints {
            $0.trailing.equalTo(priceLabel.snp.leading).inset(-7)
            $0.centerY.equalTo(priceLabel)
            $0.width.equalTo(85)
            $0.height.equalTo(30)
        }
    }
    
    func configure(with config: DanilOrderPositionCell.CellConfig) {
        positionImageView.image = UIImage(named: config.imageName)
        dishLabel.text = config.dishName
        restaurantLabel.text = config.restaurantName
        userLabel.text = config.userName
        priceLabel.text = "₹ \(config.price)"
        amountCounter.currentValue = Int(config.amount)
    }
}
