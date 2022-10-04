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

    static var id: String = "AntonPriceCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 78)
    
    private let titleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Bold", size: 14))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let subtitleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Bold", size: 14))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let descriptionLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Bold", size: 16))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let topImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(hexString: "0A191E")
        return view
    }()
    
    private let middleImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(hexString: "0A191E")
        return view
    }()
    
    private let bottomImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(hexString: "0A191E")
        return view
    }()
    
    private let stackViewText: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
       return stack
    }()
    
    private let stackViewImage: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
       return stack
    }()
    
    let shadowCell: UIView = {
        let view = UIView(backgroundColor: .white)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 7
        view.layer.shadowOffset = .zero
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
        configureAppearance()
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
        subtitleLable,
        descriptionLable
        ].forEach(stackViewText.addSubview)
        
        [
        topImage,
        middleImage,
        bottomImage
        ].forEach(stackViewImage.addSubview)
        
        [
            stackViewText,
            stackViewImage
        ].forEach(shadowCell.addSubview)
    }

    private func addConstraints() {
        shadowCell.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        stackViewText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.left.equalToSuperview().inset(21)
        }
        
        stackViewImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.right.equalToSuperview().inset(35)
        }
    }

    private func configureAppearance() {
        backgroundColor = .clear
        layer.cornerRadius = 25
    }
}
