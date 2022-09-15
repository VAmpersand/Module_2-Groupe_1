//
//  AntonPersonalAboutView.swift
//  Module_2 Groupe_1
//
//  Created by air on 13.09.2022.
//

import UIKit
import SnapKit

final class AntonPersonalAboutView: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
       imageView.image = UIImage(systemName: "info.circle")
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 20
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(10)
            $0.size.equalTo(20)
        }
    }
}
