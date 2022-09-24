//
//  InfoButton.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 13.09.2022.
//

import UIKit
import SnapKit

class InfoButton: UIButton {
    
    private let containerView = UIView(backgroundColor: Constants.Color.primary)
    private let aboutLabel = UILabel(font: .getPoppinsRegular(with: 14), text: "About")
    
    private let infoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.tintColor = .black
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.InfoButtonOffset.basic
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
        addSubviews()
        addConstains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        danilMakeSystem()
    }
    
    private func addSubviews() {
        addSubview(stackView)
        containerView.addSubview(infoImageView)
        
        [
            containerView,
            aboutLabel
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstains() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constants.InfoButtonOffset.basic)
        }
        
        containerView.snp.makeConstraints {
            $0.size.equalTo(26)
        }
        
        infoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalToSuperview().multipliedBy(0.66)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            self.containerView.layer.cornerRadius = self.containerView.bounds.size.width * Constants.Multipliers.half
        }
    }
}

private extension Constants {
    enum InfoButtonOffset {
        static let basic: CGFloat = 10
    }
}
