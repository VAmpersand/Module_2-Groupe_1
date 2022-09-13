//
//  AntonInCodeLayoutController.swift
//  Module_2 Groupe_1
//
//  Created by air on 28.08.2022.
//

import UIKit
import SnapKit

final class AntonInCodeLayoutController: UIViewController {

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
    
    private let closeButton = UIButton(backgroundColor: .darkGray, title: "Close")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureAppearance()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(yellowView)
        yellowView.addSubview(greenView)
        yellowView.addSubview(redView)
        yellowView.addSubview(redView2)
        
        redView.addSubview(blueView)
        redView.addSubview(orangeView)
        redView.addSubview(cyanView)
        
        redView2.addSubview(orangeView2)
        redView2.addSubview(blueView2)
        redView2.addSubview(cyanView2)
        view.addSubview(closeButton)
    }
    
    private func configureAppearance() {
        
        view.backgroundColor = .white
        
        closeButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
    }
    
    private func addConstraints() {
        
        yellowView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        greenView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(300)
            $0.width.equalTo(150)
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(redView.snp.height)
        }
        
        redView2.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(redView)
            $0.top.equalTo(redView.snp.bottom).offset(125)
        }
        
        blueView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(19)
            $0.height.equalTo(100)
            $0.width.equalTo(blueView.snp.height)
        }
        
        blueView2.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(19)
            $0.size.equalTo(blueView)
        }
        
        orangeView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(69)
            $0.trailing.equalToSuperview().inset(42)
            $0.top.equalTo(blueView.snp.bottom).offset(-13)
            $0.width.equalTo(200)
            $0.height.equalTo(orangeView.snp.width).multipliedBy(0.5)
        }
        
        orangeView2.snp.makeConstraints {
            $0.center.leading.equalToSuperview()
            $0.trailing.equalTo(blueView2.snp.leading).offset(8)
            $0.size.equalTo(orangeView)
        }
        
        cyanView.snp.makeConstraints {
            $0.leading.trailing.equalTo(orangeView)
            $0.top.equalTo(orangeView.snp.bottom).offset(18)
            $0.height.equalTo(50)
        }
        
        cyanView2.snp.makeConstraints {
            $0.size.equalTo(cyanView)
            $0.trailing.equalTo(blueView2)
            $0.top.equalTo(orangeView2)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.size.equalTo(45)
        }
    }
    
    @objc func closeAction() {
        dismiss(animated: true)
    }
}

