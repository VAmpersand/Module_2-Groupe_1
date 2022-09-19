//
//  TopView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 10.09.2022.
//

import UIKit
import SnapKit

final class TopView: UIView {
    
    private let logoImageView = UIImageView(image: UIImage(named: "danilAuthLogo"))
    private let customSegmentedControl = CustomSegmentedControl(items: ["Login", "Sign-Up"])
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        layer.cornerRadius = Constants.BorderRadius.large
        customSegmentedControl.addTarget(self, action: #selector(segmentHandler(_:)), for: .valueChanged)
    }
    
    private func addSubviews() {
        [
            logoImageView,
            customSegmentedControl
        ].forEach(addSubview)
    }
    
    private func addConstraints() {
        logoImageView.snp.makeConstraints {
            $0.center.equalTo(safeAreaLayoutGuide)
        }
        
        customSegmentedControl.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constants.Paddings.large)
            $0.height.equalTo(55)
        }
    }
}

@objc extension TopView {
    private func segmentHandler(_ sender: CustomSegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
}
