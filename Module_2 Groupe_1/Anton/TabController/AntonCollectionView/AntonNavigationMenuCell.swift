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

    private let imageFood: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
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
    
    private let emptyCell: UIImageView = {
        let view = UIImageView()
        return view
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
        addSubview(titleLable)
        addSubview(subtitleLable)
        addSubview(descriptionLable)
        addSubview(imageFood)
        addSubview(imageStepper)
        addSubview(imagePrice)
        addSubview(emptyCell)
    }

    private func constrainSubviews() {
        imageFood.snp.makeConstraints {
            $0.left.equalToSuperview()
        }
        
        titleLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.left.equalToSuperview().inset(95)
        }
        
        subtitleLable.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom)
            $0.left.equalToSuperview().inset(95)
        }
        
        descriptionLable.snp.makeConstraints {
            $0.top.equalTo(subtitleLable.snp.bottom).inset(5)
            $0.left.equalToSuperview().inset(95)
        }
        
        imageStepper.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.right.equalToSuperview().inset(42)
        }
        
        imagePrice.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(5)
        }
    }

    private func configureAppearance() {
        backgroundColor = .clear
    }
}
