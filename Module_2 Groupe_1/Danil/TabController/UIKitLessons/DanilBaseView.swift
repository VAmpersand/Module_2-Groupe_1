//
//  DanilBaseView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 07.09.2022.
//

import UIKit

class DanilBaseView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
    }
}
