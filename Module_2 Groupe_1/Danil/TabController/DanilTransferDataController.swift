//
//  DanilTransferDataController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.09.2022.
//

import UIKit

protocol DanilTransferDataDelegate: AnyObject {
    func changeBackgroundColor(backgroundColor: UIColor) -> Void
}

class DanilTransferDataController: UIViewController {
    
    private let customView = DanilCustomView(backgroundColor: .systemGray3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        configure()
        
        customView.changeBackgroundColorCallback =  {
            self.view.backgroundColor = $0
        }
        
        customView.transferDataDelegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(_:)), name: .changeColor, object: nil)
    }
    
    private func addSubviews() {
        view.addSubview(customView)
    }
    
    private func addConstraints() {
        customView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(Constants.Multipliers.half)
            $0.width.equalToSuperview()
        }
    }
    
    private func configure() {
        view.backgroundColor = .systemPurple
    }
}

extension DanilTransferDataController: DanilTransferDataDelegate {
    func changeBackgroundColor(backgroundColor: UIColor) {
        view.backgroundColor = backgroundColor
    }
}

@objc extension DanilTransferDataController {
    private func changeColor(_ notification: Notification) {
        guard let backgroundColor = notification.object as? UIColor else { return }
        view.backgroundColor = backgroundColor
    }
}
