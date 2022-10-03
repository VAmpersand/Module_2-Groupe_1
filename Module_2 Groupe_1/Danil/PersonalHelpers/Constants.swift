//
//  personal extension that may not be useful for others
//  UIViewController + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 28.08.2022.
//

import UIKit


enum Constants {
    enum Paddings {
        static let basic: CGFloat = 16
        static let large: CGFloat = 48
    }
    
    enum Multipliers {
        static let half = 0.5
        static let double = 2
    }
    
    enum Divisors {
        static let quarter = 4
    }
    
    enum Button {
        static let basicSize  = CGSize(width: 100, height: 50)
        static let mediumSize = CGSize(width: 314, height: 49)
    }
    
    enum Color {
        static let primary = UIColor(hexString: "#F5F5F8")
        static let secondary = UIColor(hexString: "#F8774A")
        static let buttonTitle = UIColor(hexString: "#F6F6F9")
        static let placeholder = UIColor(hexString: "#BFBFBF")
    }
    
    enum BorderRadius {
        static let low: CGFloat = 10
        static let medium: CGFloat = 20
        static let large: CGFloat = 30
    }
}
