//
//  CustomSegmentedControl.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 13.09.2022.
//

import UIKit
import SnapKit

final class CustomSegmentedControl: UIControl {
    
    private (set) var selectedSegmentIndex = 0
    
    private var items: [String]
    private var buttons = [UIButton]()
    private let border = UIView(backgroundColor: Constants.Color.secondary)
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init(items: [String]) {
        self.items = items
        super.init(frame: .zero)
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        border.layer.cornerRadius = border.frame.height / 2
    }
    
    private func configureAppearance() {
        guard items.count > 0 else { return }
        
        setButtons()
        
        if let firstBtn = buttons.first {
            buttonHandler(firstBtn)
        }
    }
    
    private func addSubviews() {
        addSubview(stackView)
        addSubview(border)
        buttons.forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        border.snp.makeConstraints {
            $0.height.equalTo(3)
            $0.width.equalTo(stackView.arrangedSubviews.first!)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setButtons() {
        for i in 0..<items.count {
            let button = UIButton(backgroundColor: .clear, titleColor: .black, title: items[i])
            button.tag = i
            button.titleLabel?.font = .getPoppinsSemiBold(with: 18)
            button.titleLabel?.textAlignment = .center
            button.addTarget(self, action: #selector(buttonHandler(_:)), for: .touchUpInside)
            buttons.append(button)
        }
    }
    
    private func moveView(duration: Double = 0.5, toX: CGFloat) {
        border.transform = CGAffineTransform(translationX: border.frame.origin.x, y: 0.0)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseOut,
                       animations: {
            self.border.transform = CGAffineTransform(translationX: toX, y: 0.0)
        })
    }
}

@objc extension CustomSegmentedControl {
    private func buttonHandler(_ sender: UIButton) {
        selectedSegmentIndex = sender.tag
        moveView(toX: sender.frame.origin.x)
        sendActions(for: .valueChanged)
    }
}
