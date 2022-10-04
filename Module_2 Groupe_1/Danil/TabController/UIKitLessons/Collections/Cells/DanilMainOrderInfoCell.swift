//
//  DanilMainOrderInfo.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 01.10.2022.
//

import UIKit

extension DanilMainOrderInfoCell {
    struct CellConfig {
        let place: String
        let address: String
        let scheduledTime: UInt
    }
}

final class DanilMainOrderInfoCell: UICollectionViewCell {
    
    static let id = "orderInfoId"
    static let size = CGSize(width: UIScreen.main.bounds.width, height: 125)
    
    private let homeImageView = UIImageView(image: UIImage(named: "danilHomePrimary"))
    private let clockImageView = UIImageView(image: UIImage(named: "danilClock"))
    private let placeLabel = UILabel(font: .getPoppinsSemiBold(with: 16), text: "", numberOfLines: 1)
    private let editButton = UIButton(backgroundColor: .clear, titleColor: .black, title: "Edit Address")
    private let timeLabel = UILabel(font: .getPoppinsSemiBold(with: 14), text: "", numberOfLines: 1)
    private let scheduledTimeButton = UIButton(backgroundColor: .clear, titleColor: .black, title: "Schedule time")
    
    private let mainContainer: UIView = {
        let view = UIView(backgroundColor: UIColor(hexString: "#FEEBC1"))
        view.layer.cornerRadius = Constants.BorderRadius.low
        return view
    }()
    
    private let addressTextView: UITextView = {
        let textView = UITextView()
        textView.font = .getPoppinsSemiBold(with: 12)
        textView.textColor = UIColor(hexString: "#686868")
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        textView.textContainer.maximumNumberOfLines = 2
        textView.textContainer.lineBreakMode = .byTruncatingTail
        return textView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = -10
        return stackView
    }()
    
    private let clockContainer: UIView = {
        let view = UIView(backgroundColor: UIColor(hexString: "#E6B64E"))
        view.layer.cornerRadius = 5
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
            placeLabel,
            addressTextView,
        ].forEach(verticalStackView.addArrangedSubview)
        
        [
            homeImageView,
            verticalStackView,
            editButton,
            clockContainer,
            timeLabel,
            scheduledTimeButton
        ].forEach(mainContainer.addSubview)
        
        clockContainer.addSubview(clockImageView)
    }
    
    private func addConstraints() {
        mainContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.verticalEdges.equalToSuperview()
        }
        
        homeImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
            $0.width.equalTo(30)
            $0.height.equalTo(28)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalTo(homeImageView.snp.trailing).offset(8)
            $0.width.lessThanOrEqualTo(180)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        clockContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(13)
            $0.width.equalTo(35)
            $0.height.equalTo(30)
        }
        
        clockImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(clockContainer.snp.trailing).offset(17)
            $0.bottom.equalToSuperview().inset(17)
        }
        
        scheduledTimeButton.snp.makeConstraints {
            $0.bottom.equalTo(timeLabel)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    func configure(with config: DanilMainOrderInfoCell.CellConfig) {
        placeLabel.text = config.place
        addressTextView.text = config.address
        timeLabel.text = "\(config.scheduledTime) mins"
    }
}
