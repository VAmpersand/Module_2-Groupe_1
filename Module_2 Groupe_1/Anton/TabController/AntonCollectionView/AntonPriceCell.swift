//
//  AntonPriceCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 04.10.2022.
//

import UIKit
import SnapKit

extension AntonPriceCell {
    struct CellConfig {
        let backgroundColor: UIColor
        let title: String
        let subtitle: String
        let description: String
        let imageNameTop: String
        let imageNameMiddle: String
        let imageNameBottom: String
    }
}

final class AntonPriceCell: UICollectionViewCell {

    static var id = "AntonPriceCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 16 * 2, height: 78)
    
    private let titleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 14))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let subtitleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 14))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let descriptionLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 16))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let topImage: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Metropolis-Medium", size: 14)
        return textField
    }()
    
    private let middleImage: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Metropolis-Medium", size: 14)
        return textField
    }()
    
    private let bottomImage: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Poppins-SemiBold", size: 20)
        return textField
    }()
    
    private let stackViewTop: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
       return stack
    }()
    
    private let stackViewMiddle: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
       return stack
    }()
    
    private let stackViewBottom: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
       return stack
    }()
    
    let shadowCell: UIView = {
        let view = UIView(backgroundColor: .white)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 25
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
    }
    
    func configure(with item: CellConfig) {
        backgroundColor = item.backgroundColor
        titleLable.text = item.title
        subtitleLable.text = item.subtitle
        descriptionLable.text = item.description
        topImage.text = item.imageNameTop
        middleImage.text = item.imageNameMiddle
        bottomImage.text = item.imageNameBottom
    }

    private func addSubviews() {
        addSubview(shadowCell)
        
        [
            titleLable,
            topImage
        ].forEach(stackViewTop.addArrangedSubview)
        
        [
            subtitleLable,
            middleImage
        ].forEach(stackViewMiddle.addArrangedSubview)
        
        [
            descriptionLable,
            bottomImage
        ].forEach(stackViewBottom.addArrangedSubview)
        
        [
            stackViewTop,
            stackViewMiddle,
            stackViewBottom
        ].forEach(shadowCell.addSubview)
    }

    private func addConstraints() {
        shadowCell.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        stackViewTop.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.right.equalToSuperview().inset(35)
            $0.left.equalToSuperview().inset(20)
        }
        
        stackViewMiddle.snp.makeConstraints {
            $0.top.equalTo(stackViewTop.snp.bottom)
            $0.right.equalToSuperview().inset(35)
            $0.left.equalToSuperview().inset(20)
        }
        
        stackViewBottom.snp.makeConstraints {
            $0.top.equalTo(stackViewMiddle.snp.bottom)
            $0.right.equalToSuperview().inset(35)
            $0.left.equalToSuperview().inset(20)
        }
    }
}
