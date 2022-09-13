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
    
    func danilMakeSystem() {
        addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        addTarget(self, action: #selector(handleOut), for: [
            .touchUpInside,
            .touchUpOutside,
            .touchDragOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
}

@objc extension UIButton {
    private func handleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    
    private func handleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }
}
