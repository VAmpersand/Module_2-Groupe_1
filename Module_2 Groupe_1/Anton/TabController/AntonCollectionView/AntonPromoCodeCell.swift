//
//  AntonPromoCodeCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.10.2022.
//

import UIKit
import SnapKit

final class AntonPromoCodeCell: UICollectionViewCell {

    static var id = "AntonPromoCodeCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 40)
    
    let promoText: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Poppins-SemiBold", size: 14)
        textField.placeholder = "Enter Promo Code"
        textField.attributedText = NSAttributedString(
            string: "Enter Promo Code",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "838383")]
        )
        return textField
    }()
    
    let shadowCell: UIView = {
        let view = UIView(backgroundColor: .white)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = .zero
        return view
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton(
            backgroundColor: UIColor(hexString: "F8774A"),
            titleColor: .white,
            title: "Apply"
        )
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14)
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
    
    private func addSubviews() {
       addSubview(shadowCell)
        
        [
        promoText,
        applyButton
        ].forEach(shadowCell.addSubview)
    }

    private func addConstraints() {
        shadowCell.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        promoText.snp.makeConstraints {
            $0.left.equalToSuperview().offset(23)
            $0.centerY.equalToSuperview()
        }
        
        applyButton.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview()
            $0.width.equalTo(104)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowCell.layer.cornerRadius = shadowCell.frame.height / 2
        DispatchQueue.main.async {
            self.applyButton.layer.cornerRadius = self.applyButton.frame.height / 2
        }
    }
}

extension AntonPromoCodeCell: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        endEditing(true)
    }
}
