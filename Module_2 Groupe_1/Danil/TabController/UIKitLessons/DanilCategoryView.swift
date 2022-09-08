//
//  DanilCategoryView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilCategoryView: DanilBaseView {
    
    private var categoryImageView: UIImageView
   
    //add label then
    init(categoryImageView: UIImageView) {
        self.categoryImageView = categoryImageView
        super.init(frame: .zero)
        configure()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        categoryImageView.tintColor = .black
        layer.cornerRadius = Constants.BorderRadius.low
    }
    
    private func addSubviews() {
        addSubview(categoryImageView)
    }
    
    private func addConstraints() {
        categoryImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(5)
            $0.size.equalTo(22)
        }
    }
}
