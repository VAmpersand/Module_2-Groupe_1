//
//  DanilToolBar.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 24.09.2022.
//

import UIKit
import SnapKit

final class DanilToolBar: UIView {
    let searchTextField = DanilSearchTextField()
    
    private let filterButton: UIButton = {
        let button = UIButton(backgroundColor: .white)
        button.setImage(UIImage(named: "danilFilter"), for: .normal)
        button.layer.cornerRadius = 13
        button.layer.borderColor = UIColor(hexString: "#C8C8C8").cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        
        searchTextField.configure(with: "Search food nearby")
    }
    
    private func addSubviews() {
        addSubview(searchTextField)
        addSubview(filterButton)
    }
    
    private func addConstraints() {
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Constants.DanilToolBarPadding.little)
            $0.top.bottom.equalToSuperview().inset(Constants.DanilToolBarPadding.tiny)
        }
        
        filterButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(Constants.DanilToolBarPadding.little)
            $0.top.bottom.equalToSuperview().inset(Constants.DanilToolBarPadding.tiny)
            $0.size.equalTo(39)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(Constants.DanilToolBarPadding.little)
        }
    }
}

private extension Constants {
    enum DanilToolBarPadding {
        static let tiny = 8
        static let little = 18
    }
}
