//
//  InCodeLayoutViewController.swift
//  Module_2 Groupe_1
//
//  Created by mac on 28.08.2022.
//

import UIKit
import SnapKit

final class EvgeniyInCodeLayoutViewController: UIViewController {
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    private let greenview: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private let redViewOne: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    private let redViewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    private let blueViewOne: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private let blueViewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        addConstraints()
        configureAppearance()
        }
    private func addSubview() {
        view.addSubview(yellowView)
        yellowView.addSubview(greenview)
        yellowView.addSubview(redViewOne)
        yellowView.addSubview(redViewTwo)
        redViewOne.addSubview(blueViewOne)
        redViewTwo.addSubview(blueViewTwo)
    }
    private func addConstraints() {
        yellowView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
            
        redViewOne.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(redViewOne.snp.width)
        }

        redViewTwo.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(redViewTwo.snp.width)
        }

        greenview.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(greenview.snp.width).multipliedBy(6)
        }

        blueViewOne.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(blueViewOne.snp.height)
            $0.top.left.equalToSuperview().inset(16)
        }
        blueViewTwo.snp.makeConstraints {
            $0.height.equalTo(blueViewOne.snp.height)
            $0.width.equalTo(blueViewOne.snp.width)
            $0.bottom.right.equalToSuperview().inset(16)
        }
    }
        private func configureAppearance() {
            view.backgroundColor = .white
        }
}
