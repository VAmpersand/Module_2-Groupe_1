//
//  UILabel + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 09.09.2022.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont? = .systemFont(ofSize: 14), text: String = "", numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
