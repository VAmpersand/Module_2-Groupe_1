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
        let title: String
    }
}

final class AntonPersonalConnectionView: UIView {
    
    private let imageView = UIImageView()
    private let label = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 18))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        imageView.image = UIImage(systemName: "chevron.right")
        
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
        label.text = viewModel.title
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 20
        imageView.tintColor = .black
        label.textColor = .black
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(label)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(42)
        }
        
        label.snp.makeConstraints { 
            $0.leading.equalToSuperview().inset(27)
            $0.centerY.equalToSuperview()
        }
    }
}

