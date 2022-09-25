//
//  NavigationLeftBarItem.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 20.09.2022.
//

import UIKit

final class NavigationLeftBarItem: UIStackView {
    
    private let houseImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "house"))
        imageView.tintColor = Constants.LeftBarItemColors.logo
        return imageView
    }()
    
    private let titleLabel = UILabel(font: .getPoppinsSemiBold(with: 16), text: "Home")
    
    private let addressLabel: UILabel = {
        let label = UILabel(font: .poppinsMedium15)
        label.textColor = Constants.LeftBarItemColors.description
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        spacing = 7
    }
    
    private func addSubviews() {
        [
            houseImageView,
            verticalStackView
        ].forEach(addArrangedSubview)
        
        [
            titleLabel,
            addressLabel
        ].forEach(verticalStackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        houseImageView.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(28)
        }
        
        addressLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(250)
        }
    }
    
    func configure(with address: String) {
        addressLabel.text = address
    }
}


private extension Constants {
    enum LeftBarItemColors {
        static let logo = UIColor(hexString: "#2E3A59")
        static let description = UIColor(hexString: "#B2B2B2")
    }
}
