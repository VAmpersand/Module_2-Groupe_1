//
//  TopView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 10.09.2022.
//

import UIKit
import SnapKit

class TopView: UIView {
    
    private let logoImageView = UIImageView(image: UIImage(named: "danilAuthLogo"))
    
    private let loginLabel: UILabel = {
        let label = UILabel(font: .poppinsSemiBold18, text: "Login")
        label.textAlignment = .center
        return label
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel(font: .poppinsSemiBold18, text: "Sign-Up")
        label.textAlignment = .center
        return label
    }()
    
    private let border = UIView(backgroundColor: Constants.Color.secondary)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        layer.cornerRadius = Constants.BorderRadius.large
    }
    
    private func addSubviews() {
        [
            logoImageView,
            loginLabel,
            signUpLabel,
            border
        ].forEach(addSubview)
        
    }
    
    private func addConstraints() {
        logoImageView.snp.makeConstraints {
            $0.center.equalTo(safeAreaLayoutGuide)
        }
        
        loginLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Constants.Paddings.large)
            $0.bottom.equalToSuperview().inset(12)
            $0.width.equalTo(134)
        }
        
        signUpLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(Constants.Paddings.large)
            $0.width.bottom.equalTo(loginLabel)
        }
        
        border.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(loginLabel)
            $0.height.equalTo(3)
            $0.leading.equalTo(loginLabel)
        }
    }
}
