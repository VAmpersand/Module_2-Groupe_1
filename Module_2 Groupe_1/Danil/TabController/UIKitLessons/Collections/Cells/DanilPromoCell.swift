//
//  DanilPromoCell.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.10.2022.
//

import UIKit

final class DanilPromoCell: UICollectionViewCell {
    
    static let id = "promoId"
    static let size = CGSize(width: UIScreen.main.bounds.width, height: 40)
    
    private let applyButton: UIButton = {
        let button = UIButton(backgroundColor: Constants.Color.secondary, titleColor: .white, title: "Apply")
        button.titleLabel?.font = .getPoppinsMedium(with: 14)
        return button
    }()
    
    private let mainContainer: UIView = {
        let view = UIView(backgroundColor: .white)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 7
        return view
    }()
    
    private let promoTextField: UITextField = {
        let textField = UITextField()
        textField.font = .getPoppinsSemiBold(with: 14)
        textField.placeholder = "Enter Promo Code"
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter Promo Code",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor(hexString: "#838383")]
        )
        textField.returnKeyType = .done
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    private func configureAppearance() {
        promoTextField.delegate = self
    }
    
    private func addSubviews() {
        addSubview(mainContainer)
        
        [
            promoTextField,
            applyButton
        ].forEach(mainContainer.addSubview)
    }
    
    private func addConstraints() {
        mainContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.verticalEdges.equalToSuperview()
        }
        
        promoTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(23)
            $0.centerY.equalToSuperview()
        }
        
        applyButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.equalTo(104)
            $0.leading.equalTo(promoTextField.snp.trailing).offset(23)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mainContainer.layer.cornerRadius = mainContainer.frame.height / 2
        DispatchQueue.main.async {
            self.applyButton.layer.cornerRadius = self.applyButton.frame.height / 2
        }
    }
}

extension DanilPromoCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}
