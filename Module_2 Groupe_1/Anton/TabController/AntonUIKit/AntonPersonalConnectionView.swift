//
//  AntonPersonalConnectionView.swift
//  Module_2 Groupe_1
//
//  Created by air on 12.09.2022.
//

import UIKit
import SnapKit

import UIKit
import SnapKit

extension AntonPersonalConnectionView {
    struct ViewModel {
    }
}

final class AntonPersonalConnectionView: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        imageView.image = UIImage(systemName: "chevron.right")
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ViewModel) {
        
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 20
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(42)
        }
    }
}

