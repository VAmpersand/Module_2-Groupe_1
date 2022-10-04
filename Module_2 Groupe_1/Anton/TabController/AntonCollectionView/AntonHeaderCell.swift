//
//  AntonHeaderCell.swift
//  Module_2 Groupe_1
//
//  Created by air on 03.10.2022.
//

import UIKit
import SnapKit
import WebKit

extension AntonHeaderCell {
    struct HeaderConfig {
        let backgroundColor: UIColor
        let title: String
        let subtitle: String
        let imageName: String
    }
}

final class AntonHeaderCell: UICollectionViewCell {

    static var id: String = "AntonHeaderCell"
    static var size = CGSize(width: UIScreen.main.bounds.width - 30 * 2, height: 35)


    private let titleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 20))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()

    private let subtitleLable: UILabel = {
        let lable = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 12))
        lable.textColor = UIColor(hexString: "0A191E")
        return lable
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let exitButton: UIButton = {
        let button = UIButton(backgroundColor: .clear)
        button.setImage(UIImage(named: "antonExit"), for: .normal)
        button.tintColor = UIColor(hexString: "0A191E")
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        configure()
        addSubviews()
        addConstrains()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)

        configure()
        addSubviews()
        addConstrains()
    }

    func configure(with item: HeaderConfig) {
        backgroundColor = item.backgroundColor
        titleLable.text = item.title
        subtitleLable.text = item.subtitle
        imageView.image = UIImage(named: item.imageName)
    }
    
    private func configure() {}

    private func addSubviews() {
        addSubview(titleLable)
        addSubview(imageView)
        addSubview(subtitleLable)
        addSubview(exitButton)
    }

    private func addConstrains() {
        titleLable.snp.makeConstraints {
            $0.centerY.left.equalToSuperview().inset(30)
        }
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(titleLable.snp.right).inset(-10)
        }
        
        subtitleLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(imageView.snp.right).inset(-10)
        }
        
        exitButton.snp.makeConstraints {
            $0.centerY.right.equalToSuperview().inset(30)
        }
    }
}


