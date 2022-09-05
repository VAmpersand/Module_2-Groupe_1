//
//  AntonTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit
import SnapKit

final class AntonTabViewController: UIViewController {
   
    @IBOutlet weak var interfaceBuilderButton: UIButton!
    
    private let inCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("InCode layout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceBuilderButton.backgroundColor = .blue
        interfaceBuilderButton.tintColor = .white
        
        view.backgroundColor = .purple
        
        view.addSubview(inCodeButton)
    
        inCodeButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        inCodeButton.translatesAutoresizingMaskIntoConstraints = false
        
        inCodeButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(interfaceBuilderButton)
            $0.bottom.equalTo(interfaceBuilderButton).offset(65)
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {}
    
    @objc func buttonHandler() {
        
        let controller = AntonInCodeLayoutController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    @IBAction func action(_ sender: Any) {
        
        let navController = UINavigationController(rootViewController: AntonTransitionDemoController())
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    @IBAction func costomAction(_ sender: Any) {
        let controller = AntonCustomView()
        view.backgroundColor = .white
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
