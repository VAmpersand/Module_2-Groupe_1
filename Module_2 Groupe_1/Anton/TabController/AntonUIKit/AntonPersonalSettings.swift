//
//  AntonPersonalSettings.swift
//  Module_2 Groupe_1
//
//  Created by air on 11.09.2022.
//

import UIKit
import SnapKit

extension AntonPersonalSettings {
    struct ViewModel {
        let image: UIImage?
    }
}

class AntonPersonalSettings: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ViewModel) {
        imageView.image = viewModel.image
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 10
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        
        imageView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(25)
            $0.top.equalToSuperview().inset(5)
        }
    }
}
