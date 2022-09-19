//
//  AntonPersonalSettingsView.swift
//  Module_2 Groupe_1
//
//  Created by air on 11.09.2022.
//

import UIKit
import SnapKit

extension AntonPersonalSettingsView {
    struct ViewModel {
        let image: UIImage?
        let title: String
    }
}

final class AntonPersonalSettingsView: UIView {
    
    private let imageView = UIImageView()
    private let label = UILabel(font: UIFont(name: "Metropolis-Regular", size: 10))
    
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
        label.text = viewModel.title
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        label.tintColor = .black
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(label)
    }
    
    private func addConstraints() {
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.top.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(17)
        }
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(4)
        }
    }
}
