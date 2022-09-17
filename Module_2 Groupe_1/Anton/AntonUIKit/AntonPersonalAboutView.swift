//
//  AntonPersonalAboutView.swift
//  Module_2 Groupe_1
//
//  Created by air on 13.09.2022.
//

import UIKit
import SnapKit

extension AntonPersonalAboutView {
    struct ViewModel {
        let title: String
    }
}

final class AntonPersonalAboutView: UIView {
    
    private let imageSimbol = UIImageView(backgroundColor: UIColor(hexString: "F5F5F8"))
    private let imageView = UIImageView()
    private let label = UILabel(font: UIFont(name: "Poppins-Regular", size: 14))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
       imageView.image = UIImage(systemName: "info.circle")
        
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
        label.tintColor = .black
    }
    
    private func addSubviews() {
        addSubview(imageSimbol)
        addSubview(label)
        imageSimbol.addSubview(imageView)
    }
    
    private func addConstraints() {
        
        imageSimbol.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.size.equalTo(25)
        }
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(40)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageSimbol.layer.cornerRadius = 0.5 * imageSimbol.bounds.size.width
    }
}
