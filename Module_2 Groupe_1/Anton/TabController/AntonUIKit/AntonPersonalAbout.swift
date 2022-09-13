//
//  AntonPersonalAbout.swift
//  Module_2 Groupe_1
//
//  Created by air on 13.09.2022.
//

import UIKit
import SnapKit

extension AntonPersonalAbout {
    struct ViewModel {
        let image: UIImage?
    }
}

class AntonPersonalAbout: UIView {
    
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
        layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {

        imageView.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(120)
        }
    }
}
