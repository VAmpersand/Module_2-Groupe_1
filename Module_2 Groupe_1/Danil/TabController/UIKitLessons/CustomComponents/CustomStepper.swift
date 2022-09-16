//
//  CustomStepper.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 14.09.2022.
//

import UIKit
import SnapKit

final class CustomStepper: UIControl {
    
    var currentValue: Int = 0 {
        didSet {
            let value = currentValue < minValue
            ? minValue
            : currentValue > maxValue ? maxValue : currentValue
            currentValue = value
            valueLabel.text = String(value)
        }
    }
    
    var minValue: Int = 0 {
        didSet {
            if minValue >= maxValue {
                minValue = maxValue - step
            }
            currentValue = { self.currentValue }()
        }
    }
    
    var maxValue: Int = 100 {
        didSet {
            if maxValue <= minValue {
                maxValue = minValue + step
            }
            currentValue = { self.currentValue }()
        }
    }
    
    var step: Int = 1
    
    private let valueLabel: UILabel = {
        let label = UILabel(font: .metropolisMedium21)
        label.textColor = Constants.Color.secondary
        label.textAlignment = .center
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(backgroundColor: .clear)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = Constants.Color.secondary
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(backgroundColor: .clear)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = Constants.Color.secondary
        return button
    }()
    
    init() {
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
        
        layer.cornerRadius = frame.height / 2
    }
    
    private func configureAppearance() {
        currentValue = { self.currentValue }()
        
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = Constants.Color.secondary.cgColor
        clipsToBounds = true
        
        [
            minusButton,
            plusButton
        ].forEach { $0.addTarget(self, action: #selector(buttonHandler(_:)), for: .touchUpInside) }
    }
    
    private func addSubviews() {
        addSubview(stackView)
        
        [
            minusButton,
            valueLabel,
            plusButton
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
    }
}

@objc extension CustomStepper {
    private func buttonHandler(_ button: UIButton) {
        switch button {
        case minusButton: currentValue -= step
        case plusButton: currentValue += step
        default: break
        }
        sendActions(for: .valueChanged)
    }
}

