//
//  AntonPersonalConnection.swift
//  Module_2 Groupe_1
//
//  Created by air on 12.09.2022.
//

import UIKit
import SnapKit

import UIKit
import SnapKit

extension AntonPersonalConnection {
    struct ViewModel {
        let image: UIImage?
    }
}

class AntonPersonalConnection: UIView {
    
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
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(50)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(315)
            $0.right.equalToSuperview().inset(42)
        }
    }
}
