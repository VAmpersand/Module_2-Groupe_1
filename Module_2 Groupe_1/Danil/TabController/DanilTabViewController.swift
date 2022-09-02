//
//  DanilTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit

final class DanilTabViewController: UIViewController {

    @IBOutlet weak var inCodeLayoutButton: UIButton!
    private let transitionDemoButton = UIButton(title: "TransitionDemo controller")
    private let transferDataButton = UIButton(backgroundColor: .lightGray, titleColor: .systemPurple, title: "TransferData controller")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
        congigure()
    }
    
    private func congigure() {
        view.backgroundColor = .orange
        transitionDemoButton.addTarget(self, action: #selector(transitionDemoButtonHandler), for: .touchUpInside)
        transferDataButton.addTarget(self, action: #selector(transferDemoButtonHandler), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(transitionDemoButton)
        view.addSubview(transferDataButton)
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
    }
    
    @IBAction func inCodeLayourButtonHandler(_ sender: Any) {
        let controller = DanilInCodeLayoutController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}

@objc extension DanilTabViewController {
    func transitionDemoButtonHandler() {
        let navController = UINavigationController(rootViewController: DanilTransitionDemoController())
        navController.modalPresentationStyle = .overFullScreen
        present(navController, animated: true)
    }
    
    func transferDemoButtonHandler() {
        let navController = UINavigationController(rootViewController: DanilTransferDataController())
        navController.modalPresentationStyle = .overFullScreen
        navController.modalTransitionStyle = .flipHorizontal
        present(navController, animated: true)
    }
}
