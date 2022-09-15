//
//  AntonTestViewController.swift
//  Module_2 Groupe_1
//
//  Created by air on 02.09.2022.
//

import UIKit
import SnapKit

final class AntonTestViewController: UIViewController {
    
    private var isPresented = false
    let button = UIButton(backgroundColor: .blue, title: "Close")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureAppearance()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(button)
    }
    
    private func configureAppearance() {
        view.backgroundColor = .red
        
        button.addTarget(self, action: #selector(testAction), for: .touchUpInside)
    }
    
    private func addConstraints() {
        button.snp.makeConstraints {
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.size.equalTo(45)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isPresented = isBeingPresented
    }
    
    @objc func testAction() {
        
        if isPresented {
            dismiss(animated: true)
        } else if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            let tabBar = TabBarController()
            tabBar.selectedIndex = Tabs.anton.rawValue
            sceneDelegate?.window?.rootViewController = tabBar
        }
    }
}
