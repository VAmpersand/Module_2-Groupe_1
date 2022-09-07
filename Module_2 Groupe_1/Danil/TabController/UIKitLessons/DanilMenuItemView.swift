//
//  DanilMenuView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilMenuItemView: DanilBaseView {
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "danilArrowRight"))
        return imageView
    }()
    
    //add label (next hw)
    init() {
        super.init(frame: .zero)
        configure()
        addSubviews()
        addConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = Constants.BorderRadius.low
    }
    
    private func addSubviews() {
        addSubview(arrowImageView)
    }
    
    private func addConstrains() {
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(31)
            $0.width.equalTo(27)
            $0.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        snp.makeConstraints {
            $0.height.equalTo(60)
        }
    }
}
