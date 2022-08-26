//
//  ViewController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 26.08.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let yellowRectangle = UIView(backgroundColor: .yellow)
    private let greenRectangle = UIView(backgroundColor: .green)
    
    //top
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
    
    
    //bottom
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
                // 16 можно вынести в константу
                //желтый вью на белый вью
                yellowRectangle.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                yellowRectangle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
                yellowRectangle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                yellowRectangle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
                
                //зеленый вью на желтый
                greenRectangle.centerXAnchor.constraint(equalTo: yellowRectangle.centerXAnchor),
                greenRectangle.centerYAnchor.constraint(equalTo: yellowRectangle.centerYAnchor),
                //0.38 можно вынести в константу)
                greenRectangle.heightAnchor.constraint(equalTo: yellowRectangle.heightAnchor, multiplier: 0.38),
                greenRectangle.widthAnchor.constraint(equalTo: greenRectangle.heightAnchor, multiplier: 0.5),
                
                
                //красный верхний вью на желтый вью
                topRedBox.topAnchor.constraint(equalTo: yellowRectangle.topAnchor, constant: 16),
                topRedBox.centerXAnchor.constraint(equalTo: yellowRectangle.centerXAnchor),
                //0.4 можно вынести в константу)
                topRedBox.heightAnchor.constraint(equalTo: yellowRectangle.heightAnchor, multiplier: 0.4),
                topRedBox.widthAnchor.constraint(equalTo: topRedBox.heightAnchor),
                
                
                //красный нижний вью на желтый вью
                bottomRedBox.bottomAnchor.constraint(equalTo: yellowRectangle.bottomAnchor, constant: -16),
                bottomRedBox.centerXAnchor.constraint(equalTo: yellowRectangle.centerXAnchor),
                bottomRedBox.widthAnchor.constraint(equalTo: topRedBox.widthAnchor),
                bottomRedBox.heightAnchor.constraint(equalTo: topRedBox.heightAnchor),
            ]
        )
    
        
        //верхний квадрат
        topBlueBox.snp.makeConstraints {
            $0.width.height.equalToSuperview().multipliedBy(0.32)
            
            $0.top.leading.equalToSuperview().inset(16)
        }
        topOrangeRectangle.snp.makeConstraints {
            $0.width.equalTo(topBlueBox.snp.width).multipliedBy(2)
            $0.height.equalTo(topBlueBox.snp.width)
            
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(42)
        }
        topTealRectangle.snp.makeConstraints {
            $0.width.equalTo(topOrangeRectangle.snp.width)
            $0.height.equalTo(topTealRectangle.snp.width).dividedBy(4)
            
            $0.trailing.equalTo(topOrangeRectangle.snp.trailing)
            $0.top.equalTo(topOrangeRectangle.snp.bottom).offset(14)
        }
        
        //нижний квадрат
        bottomBlueBox.snp.makeConstraints {
            $0.width.height.equalTo(topBlueBox)
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
        bottomOrangeRectangle.snp.makeConstraints {
            $0.width.height.equalTo(topOrangeRectangle)
            $0.leading.centerY.equalToSuperview()
        }
        bottomTealRectangle.snp.makeConstraints {
            $0.width.height.equalTo(topTealRectangle)
            $0.trailing.equalTo(bottomBlueBox)
            $0.top.equalTo(bottomOrangeRectangle.snp.top)
        }
    }
}

//можно закинуть в отдельный файл
extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
