//
//  DanilPrimaryButton.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.10.2022.
//

import UIKit

extension DanilPrimaryButtonCell {
    struct CellConfig {
        let title: String
    }
}

final class DanilPrimaryButton: UIButton {
    
    private let mainContainer = UIView(backgroundColor: Constants.Color.secondary)
    private let arrowImageView = UIImageView(image: UIImage(named: "danilRightArrow"))
    
    let buttonLabel: UILabel = {
        let label = UILabel(font: .getPoppinsMedium(with: 14), text: "", numberOfLines: 1)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.mainContainer.layer.cornerRadius = self.mainContainer.frame.height / 2
    }
    
    private func configureAppearance() {
        danilMakeSystem()
    }
    
    private func addSubviews() {
        addSubview(mainContainer)
        
        [
            buttonLabel,
            arrowImageView
        ].forEach(mainContainer.addSubview)
    }
    
    private func addConstraints() {
        mainContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        buttonLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(23)
            $0.centerY.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(buttonLabel.snp.trailing).offset(7)
            $0.width.equalTo(12)
            $0.height.equalTo(7)
        }
    }
}
