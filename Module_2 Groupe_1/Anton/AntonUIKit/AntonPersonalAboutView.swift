//
//  AntonPersonalAboutView.swift
//  Module_2 Groupe_1
//
//  Created by air on 13.09.2022.
//

import UIKit
import SnapKit

final class AntonPersonalAboutView: UIView {
    
    private let colorView = UIView(backgroundColor: UIColor(hexString: "F5F5F8"))
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.tintColor = .black
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel(font: UIFont(name: "Poppins-Regular", size: 14), text: "About")
        label.tintColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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
    
    private func configureAppearance() {
        layer.cornerRadius = 20
    }
    
    private func addSubviews() {
        addSubview(colorView)
        addSubview(label)
        colorView.addSubview(imageView)
    }
    
    private func addConstraints() {
        
        colorView.snp.makeConstraints {
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
        
        colorView.layer.cornerRadius = 0.5 * colorView.bounds.size.width
    }
}
