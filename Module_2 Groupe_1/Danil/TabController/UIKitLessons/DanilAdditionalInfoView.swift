//
//  DanilAdditionalInfoView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilAdditionalInfoView: DanilBaseView {
    
    private let containerView = UIView(backgroundColor: Constants.Color.primary)
    
    private let additionalInfoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.tintColor = .black
        return imageView
    }()
    
    private let aboutLabel = UILabel(font: .poppinsRegular14, text: "About")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(containerView)
        addSubview(aboutLabel)
        containerView.addSubview(additionalInfoImageView)
    }
    
    private func addConstraints() {
        containerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(Constants.AdditionalInfoPadding.basic)
            $0.size.equalTo(26)
        }
        
        additionalInfoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalToSuperview().multipliedBy(0.66)
        }
        
        aboutLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(containerView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(Constants.AdditionalInfoPadding.basic)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.cornerRadius = Constants.Multipliers.half * containerView.bounds.size.width
    }
}

private extension Constants {
    enum AdditionalInfoPadding {
        static let basic = 12
    }
}
