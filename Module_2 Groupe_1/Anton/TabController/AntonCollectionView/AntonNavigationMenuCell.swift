//
//  AntonNavigationMenuCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 03.10.2022.
//

import UIKit
import SnapKit

extension AntonNavigationMenuCell {
    struct CellConfig {
        let backgroundColor: UIColor
        let title: String
        let subtitle: String
        let description: String
        let imageNameFood: String
        let imageNameStepper: String
        let imageNamePrice: String
    }
}

final class AntonNavigationMenuCell: UICollectionViewCell {

    static var id = "AntonNavigationMenuCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 72)

    private let imageFood: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Medium", size: 14))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()

    private let subtitleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Medium", size: 12))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()

    private let descriptionLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Metropolis-Medium", size: 8))
        lable.textColor = .black
        return lable
    }()
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
       return stack
    }()
    
    private let imageStepper: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let imagePrice: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let stackViewImage: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
       return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        constrainSubviews()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)

        setupSubviews()
        constrainSubviews()
        configureAppearance()
    }

    func configure(with item: CellConfig) {
        backgroundColor = item.backgroundColor
        titleLable.text = item.title
        subtitleLable.text = item.subtitle
        descriptionLable.text = item.description
        imageFood.image = UIImage(named: item.imageNameFood)
        imageStepper.image = UIImage(named: item.imageNameStepper)
        imagePrice.image = UIImage(named: item.imageNamePrice)
    }

    private func setupSubviews() {
        addSubview(imageFood)
        addSubview(stackView)
        addSubview(stackViewImage)
        
        [
            titleLable,
            subtitleLable,
            descriptionLable
        ].forEach(stackView.addArrangedSubview)
        
        [
            imageStepper,
            imagePrice
        ].forEach(stackViewImage.addArrangedSubview)
    }

    private func constrainSubviews() {
        imageFood.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(imageFood.snp.right).offset(15)
        }
        
        stackViewImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(3)
            $0.left.greaterThanOrEqualTo(stackView.snp.right).offset(-15)
        }
    }

    private func configureAppearance() {
        backgroundColor = .clear
    }
}
