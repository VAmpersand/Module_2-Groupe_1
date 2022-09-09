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
    }
}

final class DanilPersonalInfoView: DanilBaseView {
    
    private let personalAvatar: UIImageView = UIImageView(image: UIImage(systemName: "person"))
        
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
    }
    
    private func configureAppearance() {
        layer.cornerRadius = Constants.BorderRadius.medium
    }
    
    private func addSubviews() {
        addSubview(personalAvatar)
    }
    
    private func addConstraints() {
        personalAvatar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.Paddings.basic)
            $0.leading.equalToSuperview().offset(Constants.PersonalInfoPadding.medium)
            $0.bottom.equalToSuperview().inset(45)
            $0.size.equalTo(Constants.PersonalInfoImageView.size)
        }
    }
}

private extension Constants {
    enum PersonalInfoPadding {
        static let medium = 31
    }
    enum PersonalInfoImageView {
        static let size  = CGSize(width: 91, height: 93)
    }
}
