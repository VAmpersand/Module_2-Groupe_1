//
//  DanilPersonalInfoView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

extension DanilPersonalInfoView {
    struct ViewModel {
        let avatarUrlString: String
        let name: String
        let email: String
        let phone: String
        let address: String
    }
}

final class DanilPersonalInfoView: DanilBaseView {
    
    private let personalAvatar: UIImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private let container = UIView()
    
    private let nameLabel = UILabel(font: .poppinsRegular18)
    private let emailLabel: UILabel = {
        let label = UILabel(font: .metropolisRegular15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    private let phoneLabel = UILabel(font: .metropolisRegular15)
    private let addressLabel = UILabel(font: .metropolisRegular15, numberOfLines: 3)
    
    private let emailSeparator = UIView(backgroundColor: .black.withAlphaComponent(Constants.Multipliers.half))
    private let phoneSeparator = UIView(backgroundColor: .black.withAlphaComponent(Constants.Multipliers.half))
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
        configureAppearance()
        
        
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ViewModel) {
        personalAvatar.image = UIImage(named: viewModel.avatarUrlString)
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
        phoneLabel.text = viewModel.phone
        addressLabel.text = viewModel.address
        
        emailSeparator.snp.makeConstraints {
            $0.width.equalTo(emailLabel.intrinsicContentSize)
        }
    }
    
    private func configureAppearance() {
        layer.cornerRadius = Constants.BorderRadius.medium
        
        [
            emailLabel,
            phoneLabel,
            addressLabel
        ].forEach {
            $0.textColor = .black.withAlphaComponent(Constants.Multipliers.half)
        }
    }
    
    private func addSubviews() {
        addSubview(personalAvatar)
        addSubview(container)
        [
            nameLabel,
            emailLabel,
            emailSeparator,
            phoneLabel,
            phoneSeparator,
            addressLabel
        ].forEach(container.addSubview)
    }
    
    private func addConstraints() {
        personalAvatar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.Paddings.basic)
            $0.leading.equalToSuperview().offset(Constants.PersonalInfoPadding.medium)
            $0.size.equalTo(Constants.PersonalInfoImageView.size)
        }
        
        container.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalTo(personalAvatar.snp.trailing).offset(Constants.Paddings.basic)
            $0.bottom.equalToSuperview().inset(Constants.Paddings.basic)
            $0.trailing.equalToSuperview().inset(Constants.PersonalInfoPadding.medium)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        emailSeparator.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(Constants.PersonalInfoPadding.tiny)
            $0.height.equalTo(1)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(emailSeparator.snp.bottom).offset(Constants.PersonalInfoPadding.extraSmall)
            $0.leading.trailing.equalToSuperview()
        }
        
        phoneSeparator.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(Constants.PersonalInfoPadding.tiny)
            $0.size.equalTo(emailSeparator)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(phoneSeparator).offset(Constants.PersonalInfoPadding.extraSmall)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

private extension Constants {
    enum PersonalInfoPadding {
        static let extraSmall = 6
        static let tiny = 10
        static let medium = 28
    }
    enum PersonalInfoImageView {
        static let size  = CGSize(width: 91, height: 93)
    }
}
