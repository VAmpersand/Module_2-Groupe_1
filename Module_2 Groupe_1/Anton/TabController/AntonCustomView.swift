//
//  AntonCustomView.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.09.2022.
//

import UIKit
import SnapKit

protocol AntonCustomViewDelegate: AnyObject {
    func returnControllerLabel(_ color: UIColor)
}

final class AntonCustomView: UIViewController {
    
    private let antonButtonCustomView = AntonButtonCustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let customViewButton = UIButton(backgroundColor: .white, title: "")
        customViewButton.addTarget(self, action: #selector(customViewAction), for: .touchUpInside)
        view.addSubview(customViewButton)
        view.addSubview(antonButtonCustomView)
        
        customViewButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(400)
            
            antonButtonCustomView.snp.makeConstraints {
                $0.center.equalTo(customViewButton)
                $0.size.equalTo(customViewButton)
            }
            
            antonButtonCustomView.color = .blue
            antonButtonCustomView.callBack = {
                self.view.backgroundColor = $0
            }
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(notificationAction(_ :)),
                                                   name: .notificationCustomButton,
                                                   object: nil)
        }
        
        antonButtonCustomView.delegate = self
    }
    
    @objc func customViewAction() {}
    
    @objc func notificationAction(_ notification: Notification) {
        guard let color = notification.object as? UIColor else { return }
        view.backgroundColor = color
    }
}

extension AntonCustomView: AntonCustomViewDelegate {
    func returnControllerLabel(_ color: UIColor) {
        view.backgroundColor = .green
    }
}
