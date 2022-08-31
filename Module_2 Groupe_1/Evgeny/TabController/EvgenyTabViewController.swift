//
//  EvgenyTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit
import SnapKit

final class EvgenyTabViewController: UIViewController {

    @IBOutlet weak var interfaceBulderButton: UIButton!
    
    private let inCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let inCodeButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button2", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let inCodeButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button3", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(inCodeButton)
        view.addSubview(inCodeButton2)
        view.addSubview(inCodeButton3)
        
        view.backgroundColor = .blue
        view.addSubview(interfaceBulderButton)
        
        
        
        inCodeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(inCodeButton.snp.height).multipliedBy(6)
            
        }
        
        inCodeButton2.snp.makeConstraints {
            $0.top.equalTo(inCodeButton).offset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(inCodeButton2.snp.height).multipliedBy(6)
        }
        
        inCodeButton3.snp.makeConstraints {
            $0.top.centerX.equalTo(inCodeButton2).offset(50)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(inCodeButton2)
        }
        
        
        inCodeButton3.addTarget(self, action: #selector(buttonHundler), for: .touchUpInside)
        
        }
        @objc func buttonHundler() {
            print("buttonHundler")
            
            let controller = EvgenyInCodeLayoutViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
            
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interfaceBulderButton.backgroundColor = .blue
        interfaceBulderButton.tintColor = .white
    }
}

