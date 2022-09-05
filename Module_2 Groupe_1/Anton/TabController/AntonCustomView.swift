//
//  AntonCustomView.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.09.2022.
//

import UIKit
import SnapKit


final class AntonCustomView: UIViewController {
    
    private let antonButtonCustomView = AntonButtonCustomView()
    weak var delegate: AntonButtonCustomViewDelegate?
    var lable = UILabel()

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
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(notificationAction),
                                                   name: .testName,
                                                   object: nil)
        }
        
//        view.addSubview(lable)
//
//        lable.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
    }
    
    @objc func customViewAction() {
        
    }
    
    @objc func notificationAction(_ notification: Notification) {
//        guard let color = notification.object as? UIColor else { return }
        
    }
}
