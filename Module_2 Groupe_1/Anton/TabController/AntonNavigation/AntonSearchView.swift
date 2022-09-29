//
//  AntonSearchView.swift
//  Module_2 Groupe_1
//
//  Created by air on 24.09.2022.
//

import UIKit
import SnapKit

final class AntonSearchView: UIView {
     
    private let searchField: UISearchTextField = {
        let search = UISearchTextField()
        search.placeholder = "Search food nearby"
        search.font = UIFont(name: "Roboto", size: 17)
        search.textColor = .gray.withAlphaComponent(0.5)
        return search
    }()
    
    private let rectangleButton: UIButton = {
        let button = UIButton(backgroundColor: .white)
        button.setImage(UIImage(named: "antonFilter"), for: .normal)
        button.layer.cornerRadius = 13
        button.layer.borderColor = UIColor(hexString: "#C8C8C8").cgColor
        button.layer.borderWidth = 1
        button.tintColor = UIColor(hexString: "079D49")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        backgroundColor = .white
    }
    
    private  func addSubviews() {
        addSubview(searchField)
        addSubview(rectangleButton)
    }
    
    private func addConstraints() {
        searchField.snp.makeConstraints {
            $0.left.equalToSuperview().inset(18)
            $0.top.bottom.equalToSuperview().inset(8)
        }
        
        rectangleButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(18)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(38)
            $0.left.equalTo(searchField.snp.right).offset(18)
        }
    }
}



