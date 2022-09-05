//
//  AntonButtonCustomView.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.09.2022.
//

import UIKit
import SnapKit

protocol AntonButtonCustomViewDelegate: AnyObject {
    func returnControllerLabel(_ lable: UIColor)
}

final class AntonButtonCustomView: UIView {
    
    public var color = UIColor.blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    
    let callBackCustomButton = UIButton(backgroundColor: .darkGray, title: "callBackCustomButton")
    let delegateCustomButton = UIButton(backgroundColor: .darkGray, title: "delegateCustomButton")
    let notificationCustomButton = UIButton(backgroundColor: .darkGray, title: "notificationCustomButton")
    
    private func configureAppearanceCostom() {
        backgroundColor = .black
        
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
    
    private func addSubviewsCostom() {
        addSubview(stackView)
        
        [
            callBackCustomButton,
            delegateCustomButton,
            notificationCustomButton
            
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraintsCostom() {
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
        let controller = AntonCustomView()
        controller.delegate = self
    }
    
    @objc func delegateCustomAction() {
        let controller = AntonCustomView()
        controller.delegate = self
    }
    
    @objc func notificationCustomAction() {
        let controller = AntonCustomView()
        controller.delegate = self
//        Notification.default.post(name: .testName, object: color)
    }
}

extension AntonButtonCustomView: AntonButtonCustomViewDelegate {
    func returnControllerLabel(_ lable: UIColor) {
    }
}

extension Notification.Name {
    static let testName = Notification.Name("testName")
}

