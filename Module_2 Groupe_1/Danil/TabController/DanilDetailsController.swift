//
//  DetailsController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.08.2022.
//

import UIKit

final class DanilDetailsController: UIViewController {
    
    private var isModal = false
    
    private let closeButton = UIButton(backgroundColor: .systemBlue, titleColor: .white, title: "Close")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isBeingPresented {
            isModal = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemGray5
        closeButton.addTarget(self, action: #selector(closeButtonHandler), for: .touchUpInside)
    }
    
    private func addConstraints() {
        closeButton.snp.makeConstraints {
            $0.size.equalTo(Constants.Button.basicSize)
            $0.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(Constants.Paddings.basic)
        }
    }
    
    private func addSubviews() {
        view.addSubview(closeButton)
    }
    
    @objc private func closeButtonHandler() {
        if isModal {
            dismiss(animated: true)
        } else if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            let tabBarController = TabBarController()
            tabBarController.selectedIndex = Tabs.danil.rawValue
            sceneDelegate?.window?.rootViewController = tabBarController
        }
    }
}
