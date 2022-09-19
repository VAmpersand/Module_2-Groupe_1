//
//  AntonPersonalInfoView.swift
//  Module_2 Groupe_1
//
//  Created by air on 10.09.2022.
//

import UIKit
import SnapKit

extension AntonPersonalInfoView {
    struct ViewModel {
        let image: UIImage?
        let name: String
        let email: String
        let phone: String
        let address: String
    }
}

final class AntonPersonalInfoView: UIView {
    
    private let antonAuthViewController = AntonAuthViewController()
    private let container = UIView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel(font: UIFont(name: "Poppins-Regular", size: 18), numberOfLines: 0)
    private let lineEmail = UIView(backgroundColor: .black.withAlphaComponent(0.5))
    private let linePhone = UIView(backgroundColor: .black.withAlphaComponent(0.5))
    
    private let emailLabel: UILabel = {
        let label = UILabel(font: UIFont(name: "Metropolis-Regular", size: 15), numberOfLines: 0)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel(font: UIFont(name: "Metropolis-Regular", size: 15), numberOfLines: 0)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel(font: UIFont(name: "Metropolis-Regular", size: 15), numberOfLines: 0)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    func configure(with viewModel: ViewModel) {
        imageView.image = viewModel.image
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
        phoneLabel.text = viewModel.phone
        addressLabel.text = viewModel.address
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        layer.cornerRadius = 20
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(container)
        
        [
            nameLabel,
            emailLabel,
            phoneLabel,
            addressLabel,
            lineEmail,
            linePhone,
        ].forEach(container.addSubview)
    }
    
    private func addConstraints() {
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.leading.equalToSuperview().inset(31)
            $0.bottom.greaterThanOrEqualToSuperview().inset(45)
            $0.size.equalTo(93)
        }
        
        container.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
        }

        lineEmail.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(5)
            $0.height.equalTo(1)
            $0.width.equalTo(165)
            $0.leading.equalToSuperview()
        }

        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(lineEmail.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
        }

        linePhone.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(5)
            $0.size.equalTo(lineEmail)
        }

        addressLabel.snp.makeConstraints {
            $0.top.equalTo(linePhone).offset(5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
