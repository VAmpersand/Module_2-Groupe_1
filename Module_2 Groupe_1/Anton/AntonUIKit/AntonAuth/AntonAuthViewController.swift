//
//  AntonAuthViewController.swift
//  Module_2 Groupe_1
//
//  Created by air on 16.09.2022.
//

import UIKit
import SnapKit

final class AntonAuthViewController: UIViewController {
    
    private let antonAuthLogoView = AntonAuthLogoView()
    private let loginText = AntonTextField(placeholderText: "Username, Mobile Number")
    
    private let passwordText: UITextField = {
        let textField = AntonTextField(placeholderText: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loginText.becomeFirstResponder()
    }
    
    private func configureAppearance() {
        view.backgroundColor = UIColor(hexString: "F5F5F8")
    }
    
    private func addSubviews() {
        view.addSubview(antonAuthLogoView)
        view.addSubview(stackView)
        
        [
            loginText,
            passwordText
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        antonAuthLogoView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(antonAuthLogoView.snp.bottom).offset(45)
            $0.leading.trailing.equalToSuperview().inset(45)
        }
        
        loginText.snp.makeConstraints {
            $0.height.equalTo(58)
        }
        
        passwordText.snp.makeConstraints {
            $0.height.equalTo(loginText)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}


