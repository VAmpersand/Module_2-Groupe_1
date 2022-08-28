//
//  EvgenyTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit
import SnapKit

final class EvgenyTabViewController: UIViewController {

    @IBOutlet weak var intefaceBulderButton: UIButton!
    
    private let inCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    private let inCodeButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    private let inCodeButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button3", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(intefaceBulderButton)
        
        inCodeButton.translatesAutoresizingMaskIntoConstraints = false
        inCodeButton2.translatesAutoresizingMaskIntoConstraints = false
        inCodeButton3.translatesAutoresizingMaskIntoConstraints = false
        
        
        inCodeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(116)
            $0.width.equalToSuperview().offset(-20)
        }
        
        inCodeButton2.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(inCodeButton2.snp.height).multipliedBy(6)
        }
        
        inCodeButton3.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.size.equalTo(inCodeButton2)
        }
        
        
        inCodeButton3.addTarget(self, action: #selector(buttonHundler), for: .touchUpInside)
        
        }
        @objc func buttonHundler () {
            print("buttonHundler")
            
            let controller  = InCodeLayoutViewController()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
            
    }
}

