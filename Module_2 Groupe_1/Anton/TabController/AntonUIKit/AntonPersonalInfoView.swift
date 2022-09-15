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
    }
}

final class AntonPersonalInfoView: UIView {
    
    private let imageView = UIImageView()
    
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
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        layer.cornerRadius = 10
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.left.equalToSuperview().inset(31)
            $0.bottom.equalToSuperview().inset(45)
            $0.size.equalTo(93)
        }
    }
}
