//
//  BaseTextView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 10.09.2022.
//

import UIKit

class BaseTextField: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)

        configureAppearance(with: placeholderText)
        addConstraints()
    }
    
    private func configureAppearance(with placeholderText: String) {
        font = .nunitoRegular16
        backgroundColor = .white
        layer.cornerRadius = Constants.BorderRadius.low
        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes:[NSAttributedString.Key.foregroundColor: Constants.Color.placeholder])
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 5))
        leftViewMode = .always
        rightViewMode = .always
        leftView = paddingView
        rightView = paddingView
    }
    
    private func addConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(58)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
