//
//  DanilCategoryView.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilCategoryView: DanilBaseView {
    
    private let categoryImageView = UIImageView()
    private let categoryLabel = UILabel(font: .getMetropolisRegular(with: 10))
   
    init(categoryImage: UIImage, labelText: String) {
        categoryImageView.image = categoryImage
        self.categoryLabel.text = labelText
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
        addSubview(categoryLabel)
    }
    
    private func addConstraints() {        
        categoryImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(10)
            $0.size.equalTo(22)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(categoryImageView.snp.bottom).offset(4)
        }
    }
}
