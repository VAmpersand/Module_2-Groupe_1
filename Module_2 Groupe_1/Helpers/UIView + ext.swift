//
//  UIView + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 27.08.2022.
//

import UIKit

extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
