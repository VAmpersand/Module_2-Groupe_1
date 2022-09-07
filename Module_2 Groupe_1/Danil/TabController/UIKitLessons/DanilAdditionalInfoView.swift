//
//  DanilAdditionalInfoView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilAdditionalInfoView: DanilBaseView {
    
    private let containerView: UIView = {
        let view = UIView(backgroundColor: UIColor(hexString: Constants.Color.mainBackground))
        return view
    }()
    
    private let additionalInfoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.tintColor = UIColor(hexString: Constants.Color.black)
        return imageView
    }()
    
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
        containerView.addSubview(additionalInfoImageView)
    }
    
    private func addConstraints() {
        containerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
            $0.size.equalTo(26)
        }
        
        additionalInfoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalToSuperview().dividedBy(1.5)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.cornerRadius = Constants.Multipliers.half * containerView.bounds.size.width
    }
}
