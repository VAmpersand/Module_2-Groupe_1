//
//  InCodeLayoutController.swift
//  Module_2 Groupe_1
//
//  Created by air on 28.08.2022.
//

import UIKit
import SnapKit

final class InCodeLayoutController: UIViewController {

    private let yellowView: UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let redView2: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let blueView2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let orangeView2: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let cyanView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private let cyanView2: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    private func addSubviews() {
        view.addSubview(yellowView)
        yellowView.addSubview(greenView)
        yellowView.addSubview(redView)
        yellowView.addSubview(redView2)
        redView.addSubview(blueView)
        redView2.addSubview(blueView2)
        blueView.addSubview(orangeView)
        blueView2.addSubview(orangeView2)
        orangeView.addSubview(cyanView)
        orangeView2.addSubview(cyanView2)
        blueView2.addSubview(cyanView2)
    }
    
    private func addConstraints() {
        yellowView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        greenView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(300)
            $0.width.equalTo(150)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(311)
            $0.width.equalTo(redView.snp.height)
        }
        
        redView2.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(redView)
        }
        
        blueView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(19)
            $0.top.equalToSuperview().inset(19)
            $0.height.equalTo(100)
            $0.width.equalTo(blueView.snp.height)
        }
        
        blueView2.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(19)
            $0.trailing.equalToSuperview().inset(19)
            $0.size.equalTo(blueView)
        }
        
        orangeView.snp.makeConstraints {
            $0.bottom.equalTo(blueView.snp.bottom).offset(87)
            $0.centerX.equalTo(blueView.snp.centerX).offset(101)
            $0.width.equalTo(200)
            $0.height.equalTo(orangeView.snp.width).multipliedBy(0.5)
        }
        
        orangeView2.snp.makeConstraints {
            $0.trailing.equalTo(blueView2.snp.leading).offset(8)
            $0.centerY.equalTo(blueView2.snp.centerY).offset(-86)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(orangeView)
        }
        
        cyanView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(118)
            $0.width.equalTo(orangeView.snp.width)
            $0.height.equalTo(50)
        }
        
        cyanView2.snp.makeConstraints {
            $0.size.equalTo(cyanView)
            $0.trailing.equalTo(blueView2)
            $0.top.equalTo(orangeView2)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
    }
}

