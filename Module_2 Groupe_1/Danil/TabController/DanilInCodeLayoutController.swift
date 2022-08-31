//
//  ViewController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 26.08.2022.
//

import UIKit
import SnapKit

final class DanilInCodeLayoutController: UIViewController {
    private let yellowRectangle = UIView(backgroundColor: .yellow)
    
    private let greenRectangle = UIView(backgroundColor: .green)
    
    private let topRedBox = UIView(backgroundColor: .red)
    
    private let topBlueBox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let topOrangeRectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private let topTealRectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    private let bottomRedBox = UIView(backgroundColor: .red)
    
    private let bottomBlueBox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let bottomOrangeRectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private let bottomTealRectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.addSubviews()
        self.addConstrains()
    }
    
    private func addSubviews() {
        view.addSubview(yellowRectangle)
        
        yellowRectangle.addSubview(greenRectangle)
        yellowRectangle.addSubview(topRedBox)
        yellowRectangle.addSubview(bottomRedBox)
        
        topRedBox.addSubview(topBlueBox)
        topRedBox.addSubview(topOrangeRectangle)
        topRedBox.addSubview(topTealRectangle)
        
        bottomRedBox.addSubview(bottomBlueBox)
        bottomRedBox.addSubview(bottomOrangeRectangle)
        bottomRedBox.addSubview(bottomTealRectangle)
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate(
            [
                yellowRectangle.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.basicPadding),
                yellowRectangle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.basicPadding),
                yellowRectangle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.basicPadding),
                yellowRectangle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.basicPadding),
                
                greenRectangle.centerXAnchor.constraint(equalTo: yellowRectangle.centerXAnchor),
                greenRectangle.centerYAnchor.constraint(equalTo: yellowRectangle.centerYAnchor),
                greenRectangle.heightAnchor.constraint(equalTo: yellowRectangle.heightAnchor, multiplier: Constants.littleMultipler),
                greenRectangle.widthAnchor.constraint(equalTo: greenRectangle.heightAnchor, multiplier: Constants.middleMultipler),
                
                topRedBox.topAnchor.constraint(equalTo: yellowRectangle.topAnchor, constant: Constants.basicPadding),
                topRedBox.centerXAnchor.constraint(equalTo: yellowRectangle.centerXAnchor),
                topRedBox.heightAnchor.constraint(equalTo: yellowRectangle.heightAnchor, multiplier: Constants.mediumMultipler),
                topRedBox.widthAnchor.constraint(equalTo: topRedBox.heightAnchor),
                
                bottomRedBox.bottomAnchor.constraint(equalTo: yellowRectangle.bottomAnchor, constant: -Constants.basicPadding),
                bottomRedBox.centerXAnchor.constraint(equalTo: yellowRectangle.centerXAnchor),
                bottomRedBox.widthAnchor.constraint(equalTo: topRedBox.widthAnchor),
                bottomRedBox.heightAnchor.constraint(equalTo: topRedBox.heightAnchor),
            ]
        )
    
        topBlueBox.snp.makeConstraints {
            $0.width.height.equalToSuperview().multipliedBy(Constants.tinyMultiplier)
            $0.top.leading.equalToSuperview().inset(Constants.basicPadding)
        }
        topOrangeRectangle.snp.makeConstraints {
            $0.width.equalTo(topBlueBox).multipliedBy(Constants.doubleMultiplier)
            $0.height.equalTo(topBlueBox.snp.width)
            
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Constants.largePadding)
        }
        topTealRectangle.snp.makeConstraints {
            $0.width.equalTo(topOrangeRectangle)
            $0.height.equalTo(topTealRectangle.snp.width).dividedBy(Constants.divisor)
            $0.trailing.equalTo(topOrangeRectangle)
            $0.top.equalTo(topOrangeRectangle.snp.bottom).offset(Constants.basicPadding)
        }
        
        bottomBlueBox.snp.makeConstraints {
            $0.width.height.equalTo(topBlueBox)
            $0.bottom.trailing.equalToSuperview().inset(Constants.basicPadding)
        }
        bottomOrangeRectangle.snp.makeConstraints {
            $0.width.height.equalTo(topOrangeRectangle)
            $0.leading.centerY.equalToSuperview()
        }
        bottomTealRectangle.snp.makeConstraints {
            $0.width.height.equalTo(topTealRectangle)
            $0.trailing.equalTo(bottomBlueBox)
            $0.top.equalTo(bottomOrangeRectangle)
        }
    }
}
