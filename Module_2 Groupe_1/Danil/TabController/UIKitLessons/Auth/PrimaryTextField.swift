//
//  BaseTextView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 10.09.2022.
//

import UIKit

final class PrimaryTextField: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)

        configureAppearance(with: placeholderText)
    }
    
    private func configureAppearance(with placeholderText: String) {
        font = .nunitoRegular16
        backgroundColor = .white
        layer.cornerRadius = Constants.BorderRadius.low
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes:[NSAttributedString.Key.foregroundColor: Constants.Color.placeholder]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: Constants.Paddings.basic, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: Constants.Paddings.basic, dy: 0)
    }
}
