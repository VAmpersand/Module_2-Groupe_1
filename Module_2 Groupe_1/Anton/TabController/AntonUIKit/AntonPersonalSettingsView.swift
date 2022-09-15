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
    }
}

final class AntonPersonalSettingsView: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    func configure(with viewModel: ViewModel) {
        imageView.image = viewModel.image
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.top.equalToSuperview().inset(5)
            $0.left.right.equalToSuperview().inset(17)
        }
    }
}
