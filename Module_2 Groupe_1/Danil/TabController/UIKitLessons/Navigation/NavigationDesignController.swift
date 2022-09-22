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
    private let searchBarView = UIView()
    
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
        view.addSubview(searchBarView)
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
            $0.height.equalTo(1334)
        }
        
        searchBarView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(6)
            $0.height.equalTo(39)
        }
        
        filterButton.snp.makeConstraints {
            $0.width.equalTo(38)
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
        
        let leftBarButtonItem = NavigationLeftBarItem()
        leftBarButtonItem.configure(with: "21-42-34, Banjara Hills, Hyderbad qwe qwe qwe qwwee ew")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButtonItem)
        
        setupRightBarButtonItem()
        setupSearchBar()
    }
    
    private func setupRightBarButtonItem() {
        let heartButton = UIButton()
        heartButton.setImage(UIImage(named: "danilHeart"), for: .normal)
        let view = UIView()
        let stackView = UIStackView(arrangedSubviews: [heartButton, view])
        stackView.axis = .vertical
        stackView.spacing = 5
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackView)
        
        heartButton.addTarget(self, action: #selector(heartButtonHandler), for: .touchUpInside)
    }
    
    private func setupSearchBar() {
        let stackView = UIStackView()
        stackView.spacing = Constants.Paddings.basic
        searchBarView.addSubview(stackView)
        let searchTextField = DanilSearchTextField(placeholderText: "search food nearby")
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(filterButton)
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constants.Paddings.basic)
        }
    }
}
