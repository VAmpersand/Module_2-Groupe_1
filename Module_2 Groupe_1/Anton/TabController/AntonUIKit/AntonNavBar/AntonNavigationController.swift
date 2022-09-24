//
//  AntonNavigationController.swift
//  Module_2 Groupe_1
//
//  Created by air on 24.09.2022.
//

import UIKit
import SnapKit

final class AntonNavigationController: UIViewController {
    
    private let antonNavBarController: AntonNavBarController = {
        let navBar = AntonNavBarController()
        navBar.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navBar.navigationBar.shadowImage = UIImage()
        navBar.navigationBar.isTranslucent = false
        navBar.navigationBar.prefersLargeTitles = false
        navBar.navigationBar.backgroundColor = .white
        navBar.view.backgroundColor = .white
        return navBar
    }()
    
    private let antonSearchViewController = AntonSearchViewController()
    private let navBar = UIView(backgroundColor: .white)
    private let scrollView = UIScrollView(backgroundColor: .white)
    private let contentView = UIView(backgroundColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
        setupLeftItem()
        setupRightItem()
    }
    
    private  func addSubviews() {
        view.addSubview(navBar)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(antonSearchViewController)
    }
    
    private func addConstraints() {
        navBar.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).inset(44)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navBar.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
            $0.height.equalTo(1400)
        }
        
        antonSearchViewController.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(6)
        }
    }
    
    private func configureAppearance() {}
    
    private func setupLeftItem() {
        let coolicon = UIImageView(image: UIImage(named: "antonCoolicon"))
            coolicon.tintColor = (UIColor(hexString: "2E3A59"))
            coolicon.contentMode = .center
        
        let homeLabel = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 17))
        homeLabel.text = "Home"
        homeLabel.textColor = .black
        
        let addressLocation = UILabel(font: UIFont(name: "Poppins-Regular", size: 16))
        addressLocation.text = "21-42-34, Banjara Hills, Hyder...."
        addressLocation.textColor = .gray.withAlphaComponent(0.5)
        
        let textStack = UIStackView(arrangedSubviews: [homeLabel, addressLocation])
        textStack.axis = .vertical
        textStack.spacing = 0
        
        let leftItemStack = UIStackView(arrangedSubviews: [coolicon, textStack])
        leftItemStack.spacing = 9
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItemStack)
    }

    private func setupRightItem() {
        let heartButton = UIButton()
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        heartButton.tintColor = UIColor(hexString: "97D5C8")
        let view = UIView()
        let stackView = UIStackView(arrangedSubviews: [heartButton, view])
        stackView.axis = .vertical
        stackView.spacing = 5
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackView)

        heartButton.addTarget(self, action: #selector(heartAction), for: .touchUpInside)
    }
    
    @objc func heartAction() {}
}
