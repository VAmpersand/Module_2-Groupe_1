//
//  DanilSearchTextField.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 21.09.2022.
//

import UIKit

final class DanilSearchTextField: UISearchTextField {
    
    private let imageView = UIImageView(image: UIImage(named: "danilSearchImg"))
        
    init() {
        super.init(frame: .zero)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        font = .robotoMedium17
        backgroundColor = Constants.DanilSearchTextFieldColor.placeholder
        layer.cornerRadius = 13
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 10))
        leftViewMode = .always
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        rightViewMode = .always
    }
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(27)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(11)
        }
    }
    
    func configure(with placeholderText: String) {
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes:[.foregroundColor: Constants.DanilSearchTextFieldColor.text]
        )
    }
}

private extension Constants {
    enum DanilSearchTextFieldColor {
        static let placeholder = UIColor(hexString: "#F3F3F3")
        static let text = UIColor(hexString: "##4F4F4F")
    }
}
