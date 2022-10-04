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
        button.backgroundColor = .green
        button.tintColor = .black
        button.setTitle("TransferData controller", for: .normal)
        return button
    }()
    
    private let lessonButton = UIButton(backgroundColor: .red, titleColor: .black, title: "Lesson controller")
    
    private let collectionDemoButton = UIButton(
        backgroundColor: .white,
        titleColor: .black,
        title: "CollectionDemoController"
    )
    
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
        view.addSubview(collectionDemoButton)
    }
    
    private func configureAppearance() {
        view.backgroundColor = .purple
        
        interfaceBuilderButton.backgroundColor = .blue
        interfaceBuilderButton.tintColor = .white
        
        inCodeButton.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        tranferButton.addTarget(self, action: #selector(tranferButtonAction), for: .touchUpInside)
        lessonButton.addTarget(self, action: #selector(lessonButtonAction), for: .touchUpInside)
        collectionDemoButton.addTarget(self, action: #selector(collectionDemoAction), for: .touchUpInside)
    }
    
    private func addConstraints() {
        inCodeButton.snp.makeConstraints {
            $0.left.right.size.equalTo(interfaceBuilderButton)
            $0.top.equalTo(interfaceBuilderButton.snp.bottom).offset(15)
        }
        
        tranferButton.snp.makeConstraints {
            $0.left.right.size.equalTo(interfaceBuilderButton)
            $0.top.equalTo(inCodeButton.snp.bottom).offset(80)
        }

        lessonButton.snp.makeConstraints {
            $0.left.right.size.equalTo(interfaceBuilderButton)
            $0.top.equalTo(tranferButton.snp.bottom).offset(15)
        }
        
        collectionDemoButton.snp.makeConstraints {
            $0.left.right.size.equalTo(interfaceBuilderButton)
            $0.top.equalTo(lessonButton.snp.bottom).offset(15)
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
    
    @objc func collectionDemoAction() {
        let controller = AntonCollectionDemoController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
