//
//  DanilEditPersonalView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 09.09.2022.
//

import UIKit
import SnapKit

final class DanilEditPersonalView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(personalDetailsLabel)
        addSubview(editButton)
    }
    
    private func addConstraints() {
        personalDetailsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
