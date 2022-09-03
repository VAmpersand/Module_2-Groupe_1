//
//  DanilCustomView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.09.2022.
//

import UIKit

final class DanilCustomView: UIView {
    
    enum ButtonName {
        static let callback = "callback"
        static let delegate = "delegate"
        static let notification = "notification"
    }
    
    private let callbackButton = UIButton(title: ButtonName.callback)
    private let delegateButton = UIButton(title: ButtonName.delegate)
    private let notificationButton = UIButton(title: ButtonName.notification)
    
    var changeBackgroundColorCallback: ((UIColor) -> Void)!
    
    weak var transferDataDelegate: DanilTransferDataDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
        configure()
    }
    
    private func addSubviews() {
        addSubview(callbackButton)
        addSubview(delegateButton)
        addSubview(notificationButton)
    }
    
    private func addConstraints() {
        delegateButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Constants.Button.basicSize)
        }
        
        callbackButton.snp.makeConstraints {
            $0.size.equalTo(delegateButton)
            $0.bottom.equalTo(delegateButton.snp.top).offset(-Constants.Paddings.basic)
            $0.centerX.equalToSuperview()
        }
        
        notificationButton.snp.makeConstraints {
            $0.size.equalTo(delegateButton)
            $0.top.equalTo(delegateButton.snp.bottom).offset(Constants.Paddings.basic)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configure() {
        [callbackButton, delegateButton, notificationButton].forEach {
            $0.addTarget(self, action: #selector(buttonHandler(_:)), for: .touchUpInside)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension DanilCustomView {
    private func buttonHandler(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case ButtonName.callback: changeBackgroundColorCallback(.red)
        case ButtonName.delegate: transferDataDelegate.changeBackgroundColor(to: .green)
        case ButtonName.notification:  NotificationCenter.default.post(name: .changeColor, object: UIColor.blue)
        default: changeBackgroundColorCallback(.systemPurple)
        }
    }
}
