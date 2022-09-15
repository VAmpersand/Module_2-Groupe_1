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
    
    private let tranferButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TransferData controller", for: .normal)
        return button
    }()
    
    private let lessonButton = UIButton(backgroundColor: .red, titleColor: .black, title: "Lesson controller")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    private func addSubviews() {
        view.addSubview(inCodeButton)
        view.addSubview(tranferButton)
        view.addSubview(lessonButton)
    }
    
    private func configureAppearance() {
        view.backgroundColor = .purple
        
        interfaceBuilderButton.backgroundColor = .blue
        interfaceBuilderButton.tintColor = .white
        
        tranferButton.backgroundColor = .green
        tranferButton.tintColor = .black
        tranferButton.alpha = 0.9
        lessonButton.alpha = 0.8
        
        inCodeButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        tranferButton.addTarget(self, action: #selector(tranferButtonAction), for: .touchUpInside)
        
        inCodeButton.translatesAutoresizingMaskIntoConstraints = false
        tranferButton.translatesAutoresizingMaskIntoConstraints = false
        
        lessonButton.addTarget(self, action: #selector(lessonButtonAction), for: .touchUpInside)
    }
    
    private func addConstraints() {
        inCodeButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(interfaceBuilderButton)
            $0.bottom.equalTo(interfaceBuilderButton).offset(65)
        }
        
        tranferButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(inCodeButton)
            $0.bottom.equalTo(inCodeButton).offset(130)
        }
        
        lessonButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(tranferButton)
            $0.bottom.equalTo(tranferButton).offset(65)
        }
    }

    @IBAction func buttonAction(_ sender: Any) {}
    
    @objc func buttonHandler() {
        let controller = AntonInCodeLayoutController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction func action(_ sender: Any) {
        let navController = UINavigationController(rootViewController: AntonTransitionDemoController())
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    @objc func tranferButtonAction() {
        let controller = AntonTransferDataController()
        present(controller, animated: true)
    }
    
    @objc func lessonButtonAction() {
        let controller = AntonUILessonViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
