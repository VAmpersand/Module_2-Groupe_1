//
//  TransitionDemoController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.08.2022.
//

import UIKit

class DanilTransitionDemoController: UIViewController {
    
    private let seguePopoverButton = UIButton(backgroundColor: .darkGray, titleColor: .systemPink, title: "Popover")
    private let segueFullScreenButton = UIButton(backgroundColor: .systemIndigo, titleColor: .darkText, title: "FullScreen")
    private let segueOverFullScreenButton = UIButton(backgroundColor: .lightGray, titleColor: .magenta, title: "OverFullScreen")
    
    private let navigationButton = UIButton(backgroundColor: .white, titleColor: .brown, title: "Navigation Button")
    private let navigationRootButton = UIButton(backgroundColor: .systemBlue, titleColor: .white, title: "Navigation Root Button")
    
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
            $0.size.greaterThanOrEqualTo(Constants.Button.basicSize)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(Constants.Paddings.basic)
        }
        
        segueFullScreenButton.snp.makeConstraints {
            $0.size.equalTo(seguePopoverButton)
            $0.leading.equalTo(seguePopoverButton)
            $0.top.equalTo(seguePopoverButton.snp.bottom).offset(Constants.Paddings.basic)
        }
        
        segueOverFullScreenButton.snp.makeConstraints {
            $0.size.equalTo(seguePopoverButton)
            $0.leading.equalTo(seguePopoverButton)
            $0.top.equalTo(segueFullScreenButton.snp.bottom).offset(Constants.Paddings.basic)
        }
        
        navigationButton.snp.makeConstraints {
            $0.width.equalTo(seguePopoverButton).multipliedBy(Constants.Multipliers.double)
            $0.height.equalTo(seguePopoverButton)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalToSuperview().inset(Constants.Paddings.basic)
        }
        
        navigationRootButton.snp.makeConstraints {
            $0.size.equalTo(navigationButton)
            $0.trailing.equalTo(navigationButton)
            $0.bottom.equalTo(navigationButton.snp.top).offset(-Constants.Paddings.basic)
        }
    }
    
    @objc func seguePopoverButtonHandler() {
        let detailsController = DanilDetailsController()
        detailsController.modalTransitionStyle = .crossDissolve
        
        present(detailsController, animated: true)
    }
    
    @objc func segueFullScreenButtonHandler() {
        let detailsController = DanilDetailsController()
        detailsController.modalPresentationStyle = .fullScreen
        detailsController.modalTransitionStyle = .flipHorizontal
        
        present(detailsController, animated: true)
    }
    
    @objc func segueOverFullScreenButtonHandler() {
        let detailsController = DanilDetailsController()
        detailsController.modalPresentationStyle = .overFullScreen
    
        present(detailsController, animated: true)
    }
    
    @objc func navigationButtonHandler() {
        self.navigationController?.pushViewController(DanilDetailsController(), animated: true)
    }
    
    @objc func navigationRootButtonHandler() {
        sceneDelegate?.window?.rootViewController = DanilDetailsController()
    }
}
