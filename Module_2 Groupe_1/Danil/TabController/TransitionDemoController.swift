//
//  TransitionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.08.2022.
//

import UIKit

class TransitionDemoController: UIViewController {
    
    private let seguePopoverButton = UIButton(backgroundColor: .darkGray, titleColor: .systemPink, title: "Popover")
    private let segueFullScreenButton = UIButton(backgroundColor: .systemIndigo, titleColor: .darkText, title: "FullScreen")
    private let segueOverFullScreenButton = UIButton(backgroundColor: .lightGray, titleColor: .magenta, title: "OverFullScreen")
    
    private let navigationButton = UIButton(backgroundColor: .white, titleColor: .brown, title: "Navigation Button")
    private let navigationRootButton = UIButton(backgroundColor: .systemBlue, titleColor: .white, title: "Navigation Root Button")
    
    private var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate else { return nil }
        
        return sceneDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        addSubviews()
        addConstraints()
        
        seguePopoverButton.addTarget(self, action: #selector(seguePopoverButtonHandler), for: .touchUpInside)
        segueFullScreenButton.addTarget(self, action: #selector(segueFullScreenButtonHandler), for: .touchUpInside)
        segueOverFullScreenButton.addTarget(self, action: #selector(segueOverFullScreenButtonHandler), for: .touchUpInside)
        navigationButton.addTarget(self, action: #selector(navigationButtonHandler), for: .touchUpInside)
        navigationRootButton.addTarget(self, action: #selector(navigationRootButtonHandler), for: .touchUpInside)
    }
    
    private func addSubviews() {
        [seguePopoverButton, segueFullScreenButton, segueOverFullScreenButton, navigationButton, navigationRootButton]
            .forEach { view.addSubview($0) }
    }
    
    private func addConstraints() {
        seguePopoverButton.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(Constants.basicButtonWidth)
            $0.height.equalTo(Constants.basicButtonHeight)
            $0.top.equalToSuperview().offset(Constants.largePadding)
            $0.leading.equalToSuperview().offset(Constants.basicPadding)
        }
        
        segueFullScreenButton.snp.makeConstraints {
            $0.size.equalTo(seguePopoverButton)
            $0.leading.equalTo(seguePopoverButton)
            $0.top.equalTo(seguePopoverButton.snp.bottom).offset(Constants.basicPadding)
        }
        
        segueOverFullScreenButton.snp.makeConstraints {
            $0.size.equalTo(seguePopoverButton)
            $0.leading.equalTo(seguePopoverButton)
            $0.top.equalTo(segueFullScreenButton.snp.bottom).offset(Constants.basicPadding)
        }
        
        navigationButton.snp.makeConstraints {
            $0.width.equalTo(seguePopoverButton).multipliedBy(Constants.doubleMultiplier)
            $0.height.equalTo(seguePopoverButton)
            $0.bottom.equalToSuperview().inset(Constants.largePadding)
            $0.trailing.equalToSuperview().inset(Constants.basicPadding)
        }
        
        navigationRootButton.snp.makeConstraints {
            $0.size.equalTo(navigationButton)
            $0.trailing.equalTo(navigationButton)
            $0.bottom.equalTo(navigationButton.snp.top).offset(-Constants.basicPadding)
        }
    }
    
    @objc func seguePopoverButtonHandler() {
        let detailsController = DetailsController()
        detailsController.modalPresentationStyle = .popover
        detailsController.modalTransitionStyle = .crossDissolve
        
        present(detailsController, animated: true)
    }
    
    @objc func segueFullScreenButtonHandler() {
        let detailsController = DetailsController()
        detailsController.modalPresentationStyle = .fullScreen
        detailsController.modalTransitionStyle = .flipHorizontal
        
        present(detailsController, animated: true)
    }
    
    @objc func segueOverFullScreenButtonHandler() {
        let detailsController = DetailsController()
        detailsController.modalPresentationStyle = .overFullScreen
    
        present(detailsController, animated: true)
    }
    
    @objc func navigationButtonHandler() {
        self.navigationController?.pushViewController(DetailsController(), animated: true)
    }
    
    @objc func navigationRootButtonHandler() {
        sceneDelegate?.window?.rootViewController = DetailsController()
    }
}
