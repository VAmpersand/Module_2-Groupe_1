//
//  AntonAuthLogoView.swift
//  Module_2 Groupe_1
//
//  Created by air on 17.09.2022.
//

import UIKit
import SnapKit

class AntonAuthLogoView: UIView {
    
    private let imageLogoView = UIImageView(image: UIImage(named: "antonLogo"))
    private let border = UIView(backgroundColor: UIColor(hexString: "FA4A0C"))
    
    private let loginLabel: UILabel = {
        let label = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 18), text: "Login")
        label.textAlignment = .center
        return label
    }()
    
    private let singUpLabel: UILabel = {
        let label = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 18), text: "Sing-up")
        label.textAlignment = .center
        return label
    }()
                            
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
        layer.cornerRadius = 30
    }
    
    private func addSubviews() {
       
        [
            imageLogoView,
            border,
            loginLabel,
            singUpLabel
        ].forEach(addSubview)
    }
    
    private func addConstraints() {
        imageLogoView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        loginLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(12)
            $0.width.equalTo(130)
        }
        
        singUpLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.width.equalTo(loginLabel)
        }
        
        border.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.width.equalTo(loginLabel)
            $0.height.equalTo(3)
        }
    }
}

