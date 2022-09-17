//
//  AntonTextField.swift
//  Module_2 Groupe_1
//
//  Created by air on 17.09.2022.
//

import UIKit

final class AntonTextField: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)

        configureAppearance(with: placeholderText)
    }
    
    private func configureAppearance(with placeholderText: String) {
        font = UIFont(name: "Nunito-Regular", size: 16)
        backgroundColor = .white
        layer.cornerRadius = 10
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "A0A0A0")]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
}
