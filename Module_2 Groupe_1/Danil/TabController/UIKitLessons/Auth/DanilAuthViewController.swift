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
    private let loginTextField = PrimaryTextField(placeholderText: "Username, Mobile Number")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    private let stepper = CustomStepper()
    
    private let passwordTextField: UITextField = {
        let textField = PrimaryTextField(placeholderText: "Password")
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
        
        stepper.addTarget(self, action: #selector(stepperHandler), for: .valueChanged)
    }
    
    private func addSubviews() {
        [
            topView,
            stackView,
            stepper
        ].forEach(view.addSubview)
        
        [
            loginTextField,
            passwordTextField,
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
        
        loginTextField.snp.makeConstraints {
            $0.height.equalTo(58)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(loginTextField)
        }
        
        stepper.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(Constants.Paddings.large)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}

@objc extension DanilAuthViewController {
    private func stepperHandler() {
        print(stepper.currentValue)
    }
}
