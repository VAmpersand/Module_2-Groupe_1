//
//  AntonTransferDataController.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.09.2022.
//

import UIKit
import SnapKit

protocol AntonTransferDataControllerDelegate: AnyObject {
    func get(color: UIColor)
}

final class AntonTransferDataController: UIViewController {
    
    private let antonButtonCustomView = AntonButtonCustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    private  func addSubviews() {

        view.addSubview(antonButtonCustomView)
    }

    private func addConstraints() {

            antonButtonCustomView.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.size.equalTo(antonButtonCustomView.snp.width)
            }
        }
    
    private func configureAppearance() {

        antonButtonCustomView.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationAction(_ :)),
                                               name: .notificationCustomButton,
                                               object: nil)
     
        antonButtonCustomView.color = .blue
        antonButtonCustomView.callBack = {
            self.view.backgroundColor = $0
        }
    }
    
    @objc func notificationAction(_ notification: Notification) {
        guard let color = notification.object as? UIColor else { return }
        view.backgroundColor = color
    }
}

extension AntonTransferDataController: AntonTransferDataControllerDelegate {
    func get(color: UIColor) {
        view.backgroundColor = color
    }
}
