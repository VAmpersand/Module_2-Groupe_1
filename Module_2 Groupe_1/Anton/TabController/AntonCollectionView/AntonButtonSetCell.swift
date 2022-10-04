//
//  AntonButtonSetCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.10.2022.
//

import UIKit
import SnapKit

extension AntonButtonSetCell {
    struct CellConfig {
        let backgroundColor: UIColor
    }
}

final class AntonButtonSetCell: UICollectionViewCell {

    static var id: String = "AntonButtonSetCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 125)
    
    private let buttonSet: UIButton = {
        let button = UIButton(backgroundColor: .clear, titleColor: UIColor(hexString: "0A191E") ,title: "")
        button.titleLabel?.font = UIFont(name: "Cera Pro-Medium", size: 12)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    func configure(with item: CellConfig) {
        backgroundColor = item.backgroundColor
    }

    private func addSubviews() {
       
    }

    private func addConstraints() {
        
    }

    private func configureAppearance() {
        backgroundColor = .clear
    }
}
