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
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 85)
    
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
    
    private let topImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(hexString: "0A191E")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let middleImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(hexString: "0A191E")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let bottomImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(hexString: "0A191E")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let stackViewTop: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 240
       return stack
    }()
    
    private let stackViewMiddle: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 240
       return stack
    }()
    
    private let stackViewBottom: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 240
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
        topImage.image = UIImage(named: item.imageNameTop)
        middleImage.image = UIImage(named: item.imageNameMiddle)
        bottomImage.image = UIImage(named: item.imageNameBottom)
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
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(21)
        }
        
        stackViewMiddle.snp.makeConstraints {
            $0.top.equalTo(stackViewTop.snp.bottom).offset(2)
            $0.left.equalToSuperview().inset(21)
        }
        
        stackViewBottom.snp.makeConstraints {
            $0.top.equalTo(stackViewMiddle.snp.bottom).offset(3)
            $0.left.equalToSuperview().inset(21)
        }
    }
}
