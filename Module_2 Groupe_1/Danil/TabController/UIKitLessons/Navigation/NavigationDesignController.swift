//
//  NavigationDesignController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 20.09.2022.
//

import UIKit

final class NavigationDesignController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView(backgroundColor: .white)
    private let toolBarView = DanilToolBar()
    
    private let filterButton: UIButton = {
        let button = UIButton(backgroundColor: .white)
        button.setImage(UIImage(named: "danilFilter"), for: .normal)
        button.layer.cornerRadius = 13
        button.layer.borderColor = UIColor(hexString: "#C8C8C8").cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
        setupNavBar()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(toolBarView)
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(toolBarView.snp.bottom)
            $0.trailing.leading.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
            $0.height.equalTo(1334)
        }
        
        toolBarView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

@objc extension NavigationDesignController {
    private func heartButtonHandler() {
        let controller = UIViewController()
        controller.view.backgroundColor = .cyan
        navigationController?.pushViewController(controller, animated: true)
    }
}

private extension NavigationDesignController {
    private func setupNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .white
        
        let leftBarButtonItem = NavigationLeftBarItem()
        leftBarButtonItem.configure(with: "21-42-34, Banjara Hills, Hyderbad")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButtonItem)
        
        let heartButton = UIButton()
        heartButton.setImage(UIImage(named: "danilHeart"), for: .normal)
        heartButton.imageView?.contentMode = .scaleAspectFill
        let view = UIView()
        let stackView = UIStackView(arrangedSubviews: [heartButton, view])
        stackView.axis = .vertical
        stackView.spacing = 5
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackView)
        
        heartButton.addTarget(self, action: #selector(heartButtonHandler), for: .touchUpInside)
    }
}
