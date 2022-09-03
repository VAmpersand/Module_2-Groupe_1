//
//  UIButton + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.08.2022.
//

import UIKit

extension UIButton {
    convenience init(backgroundColor: UIColor = .white, titleColor: UIColor = .systemBlue, title: String = "Button") {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
