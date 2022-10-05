//
//  AntonButtonSetCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 05.10.2022.
//

import UIKit
import SnapKit

extension AntonButtonSetCell {
    struct CellConfig {
        let title: String
    }
}

final class AntonButtonSetCell: UICollectionViewCell {
    
    static var id = "AntonButtonSetCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 44)
   
    private let buttonLabel: UILabel = {
        let label = UILabel(font: UIFont(name: "Poppins-Regular", size: 14))
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    
    private let buttonSet: UIButton = {
        let button = UIButton(backgroundColor: UIColor(hexString: "F8774A"), titleColor: .clear, title: "")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
    }
    
    func configure(with item: CellConfig) {
        buttonLabel.text = item.title
    }

    private func addSubviews() {
        addSubview(buttonSet)
        buttonSet.addSubview(buttonLabel)
    }

    private func addConstraints() {
        buttonLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview()
        }
        
        buttonSet.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            self.buttonSet.layer.cornerRadius = self.buttonSet.frame.height / 2
        }
    }
}
