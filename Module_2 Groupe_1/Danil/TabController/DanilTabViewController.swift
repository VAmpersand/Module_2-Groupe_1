//
//  DanilTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit

final class DanilTabViewController: UIViewController {

    @IBOutlet weak var interfaceBuilderButton: UIButton!
    @IBOutlet weak var inCodeLayoutButton: UIButton!
    private let transitionDemoButton = UIButton(title: "TransitionDemo controller")
    private let transferDataButton = UIButton(backgroundColor: .lightGray,
                                              titleColor: .systemPurple,
                                              title: "TransferData controller")
    private let lessonButton = UIButton(backgroundColor: .systemYellow, titleColor: .black, title: "Lesson controller")
    private let collectionButton = UIButton(backgroundColor: Constants.Color.primary,
                                            titleColor: .systemGreen,
                                            title: "CollectionDemoController")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .orange
        
        transitionDemoButton.addTarget(self, action: #selector(transitionDemoButtonHandler), for: .touchUpInside)
        transferDataButton.addTarget(self, action: #selector(transferDemoButtonHandler), for: .touchUpInside)
        lessonButton.addTarget(self, action: #selector(lessonButtonHandler), for: .touchUpInside)
        collectionButton.addTarget(self, action: #selector(collectionButtonHandler), for: .touchUpInside)
    }
    
    private func addSubviews() {
        [
            transitionDemoButton,
            transferDataButton,
            lessonButton,
            collectionButton
        ].forEach(view.addSubview)
    }
    
    private func addConstraints() {
        transitionDemoButton.snp.makeConstraints {
            $0.size.equalTo(inCodeLayoutButton)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(inCodeLayoutButton.snp.bottom).offset(Constants.Paddings.basic)
        }
        
        transferDataButton.snp.makeConstraints {
            $0.size.equalTo(transitionDemoButton)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(transitionDemoButton.snp.bottom).offset(Constants.Paddings.basic)
        }
        
        lessonButton.snp.makeConstraints {
            $0.size.equalTo(transitionDemoButton)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(transferDataButton.snp.bottom).offset(Constants.Paddings.basic)
        }
        
        collectionButton.snp.makeConstraints {
            $0.bottom.equalTo(interfaceBuilderButton.snp.top).offset(-Constants.Paddings.basic)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(lessonButton)
        }
    }
    
    @IBAction func inCodeLayourButtonHandler(_ sender: Any) {
        let controller = DanilInCodeLayoutController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}

@objc extension DanilTabViewController {
    private func transitionDemoButtonHandler() {
        let navController = UINavigationController(rootViewController: DanilTransitionDemoController())
        navController.modalPresentationStyle = .overFullScreen
        present(navController, animated: true)
    }
    
    private func transferDemoButtonHandler() {
        let navController = UINavigationController(rootViewController: DanilTransferDataController())
        navController.modalPresentationStyle = .overFullScreen
        navController.modalTransitionStyle = .flipHorizontal
        present(navController, animated: true)
    }
    
    private func lessonButtonHandler() {
        let danilUIViewController = DanilUILessonViewController()
        danilUIViewController.modalPresentationStyle = .overFullScreen
        present(danilUIViewController, animated: true)
    }
    
    private func collectionButtonHandler() {
        let tabBarController = DanilShopTabBarController()
        tabBarController.selectedIndex = DanilTabs.cart.rawValue
        tabBarController.modalPresentationStyle = .overFullScreen
        present(tabBarController, animated: true)
    }
}
