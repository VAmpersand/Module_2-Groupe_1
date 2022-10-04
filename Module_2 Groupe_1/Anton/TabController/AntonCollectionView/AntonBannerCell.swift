//
//  AntonBannerCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 02.10.2022.
//

import UIKit
import SnapKit

extension AntonBannerCell {
    struct CellConfig {
        let backgroundColor: UIColor
        let title: String
        let subtitle: String
        let description: String
    }
}

final class AntonBannerCell: UICollectionViewCell {

    static var id: String = "AntonBannerCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 18 * 2, height: 125)
    
    private let upperImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "antonCoolicon"))
        view.tintColor = UIColor(hexString: "2E3A59")
        return view
    }()
    
    private let lowerImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "antonClock"))
        view.tintColor = UIColor(hexString: "0A191E")
        return view
    }()
    
    private let imageClock: UIImageView = {
        let view = UIImageView(image: UIImage(named: "antonImageClock"))
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let titleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Medium", size: 14))
        lable.textColor = .black
        return lable
    }()
    
    private let subtitleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Regular", size: 12))
        lable.textColor = UIColor(hexString: "686868")
        lable.numberOfLines = 2
        return lable
    }()
    
    private let descriptionLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-Medium", size: 14))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let editButton: UIButton = {
        let button = UIButton(backgroundColor: .clear, titleColor: UIColor(hexString: "0A191E") ,title: "Edit Address")
        button.titleLabel?.font = UIFont(name: "Cera Pro-Medium", size: 12)
        return button
    }()
    
    private let timeButton: UIButton = {
        let button = UIButton(backgroundColor: .clear, titleColor: UIColor(hexString: "0A191E") ,title: "Schedule time")
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 11)
        return button
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
    }

    private func addSubviews() {
        addSubview(upperImage)
        addSubview(titleLable)
        addSubview(subtitleLable)
        addSubview(descriptionLable)
        addSubview(editButton)
        addSubview(timeButton)
        addSubview(imageClock)
        imageClock.addSubview(lowerImage)
    }

    private func addConstraints() {
        upperImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.left.equalToSuperview().inset(20)
        }
        
        imageClock.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        lowerImage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        titleLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.left.equalToSuperview().inset(60)
        }
        
        subtitleLable.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom)
            $0.left.equalToSuperview().inset(60)
            $0.right.equalToSuperview().inset(100)
        }
        
        descriptionLable.snp.makeConstraints {
            $0.left.equalToSuperview().inset(72)
            $0.bottom.equalToSuperview().inset(17)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.right.equalToSuperview().inset(10)
        }
        
        timeButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(18)
        }
    }

    private func configureAppearance() {
        backgroundColor = .clear
        layer.cornerRadius = 10
    }
}
