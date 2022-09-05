//
//  AntonButtonCustomView.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.09.2022.
//

import UIKit
import SnapKit

final class AntonButtonCustomView: UIView {
    
    public var color = UIColor.blue
    var callBack: ((UIColor) -> Void)?
    
    weak var delegate: AntonCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    let callBackCustomButton = UIButton(backgroundColor: .darkGray, title: "callBackButton")
    let delegateCustomButton = UIButton(backgroundColor: .darkGray, title: "delegateButton")
    let notificationCustomButton = UIButton(backgroundColor: .darkGray, title: "notificationButton")
    
    private func configureAppearance() {
        backgroundColor = .white
        
        callBackCustomButton.addTarget(self,
                                       action: #selector(callBackCustomAction),
                                       for: .touchUpInside)
        delegateCustomButton.addTarget(self,
                                       action: #selector(delegateCustomAction),
                                       for: .touchUpInside)
        notificationCustomButton.addTarget(self,
                                           action: #selector(notificationCustomAction),
                                           for: .touchUpInside)
    }
    
    private func addSubviews() {
        addSubview(stackView)
        
        [
            callBackCustomButton,
            delegateCustomButton,
            notificationCustomButton
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(16)
        }
        
        [
            callBackCustomButton,
            delegateCustomButton,
            notificationCustomButton
        ].forEach { view in
            view.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
    }
    
    @objc func callBackCustomAction() {
        callBack?(.red)
    }
    
    @objc func delegateCustomAction() {
        delegate?.returnControllerLabel(.green)
    }
    
    @objc func notificationCustomAction() {
        NotificationCenter.default.post(name: .notificationCustomButton, object: color)
    }
}

extension Notification.Name {
    static let notificationCustomButton = Notification.Name("notificationCustomButton")
}

