//
//  DanilAuthViewController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 10.09.2022.
//

import UIKit
import SnapKit

final class DanilAuthViewController: UIViewController {
    
    private let topView = TopView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    private let loginTextField = BaseTextView(placeholderText: "Username, Mobile Number")
    private let passwordTextField: UITextField = {
        let textField = BaseTextView(placeholderText: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        view.backgroundColor = Constants.Color.primary
        
    }
    
    private func addSubviews() {
        view.addSubview(topView)
        view.addSubview(stackView)
        [
            loginTextField,
            passwordTextField
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        topView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.38)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(Constants.Paddings.large)
            $0.leading.trailing.equalToSuperview().inset(Constants.Paddings.large)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}
