//
//  AntonTransitionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by air on 02.09.2022.
//

import UIKit
import SnapKit

final class AntonTransitionDemoController: UIViewController {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    
    private let popoverDefaultButton = UIButton(backgroundColor: .darkGray,
                                                title: "popoverDefaultButton")
    private let fullScreenCroseDesolveButton = UIButton(backgroundColor: .darkGray,
                                                        title: "fullScreenCroseDesolveButton")
    private let overFullScreenFlipHorizontalButton = UIButton(backgroundColor: .darkGray,
                                                              title: "overFullScreenFlipHorizontalButton")
    private let navigationButton = UIButton(backgroundColor: .darkGray,
                                            title: "navigationButton")
    private let changeRootButton = UIButton(backgroundColor: .darkGray,
                                            title: "changeRootButton")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureAppearance()
        addConstraints()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        popoverDefaultButton.addTarget(self,
                                       action: #selector(popoverDefaultAction),
                                       for: .touchUpInside)
        fullScreenCroseDesolveButton.addTarget(self,
                                               action: #selector(fullScreenCroseDesolveAction),
                                               for: .touchUpInside)
        overFullScreenFlipHorizontalButton.addTarget(self,
                                                     action: #selector(overFullScreenFlipHorizontalAction),
                                                     for: .touchUpInside)
        navigationButton.addTarget(self,
                                   action: #selector(navigationAction),
                                   for: .touchUpInside)
        changeRootButton.addTarget(self,
                                   action: #selector(changeRootAction),
                                   for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
        
        [
            popoverDefaultButton,
            fullScreenCroseDesolveButton,
            overFullScreenFlipHorizontalButton,
            navigationButton,
            changeRootButton
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(16)
        }
        
        [
            popoverDefaultButton,
            fullScreenCroseDesolveButton,
            overFullScreenFlipHorizontalButton,
            navigationButton,
            changeRootButton
        ].forEach { view in
            view.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
    }
}

@objc extension AntonTransitionDemoController {
    
    func popoverDefaultAction() {
        let controller = AntonTestViewController()
        present(controller, animated: true)
    }
    
    func fullScreenCroseDesolveAction() {
        let controller = AntonTestViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
    
    func overFullScreenFlipHorizontalAction() {
        let controller = AntonTestViewController()
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
    
    func navigationAction() {
        let controller = AntonTestViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func changeRootAction() {
        let controller = AntonTestViewController()
        sceneDelegate?.window?.rootViewController = controller
    }
}
