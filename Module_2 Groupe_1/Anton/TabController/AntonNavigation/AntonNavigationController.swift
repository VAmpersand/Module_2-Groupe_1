//
//  AntonNavigationController.swift
//  Module_2 Groupe_1
//
//  Created by air on 24.09.2022.
//

import UIKit
import SnapKit

final class AntonNavigationController: UIViewController {
    
    private let navBar = UIView()
    private let scrollView = UIScrollView(backgroundColor: .white)
    private let contentView = UIView(backgroundColor: .white)
    private let antonSearchView = AntonSearchView()
    private let slider = AntonDoubleSliderControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private  func addSubviews() {
        view.addSubview(navBar)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(antonSearchView)
        scrollView.addSubview(slider)
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
        
        antonSearchView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(6)
        }
        
        slider.snp.makeConstraints {
            $0.top.equalTo(antonSearchView.snp.bottom).offset(50)
            $0.left.equalToSuperview().inset(200)
            $0.height.equalTo(300)
        }
    }
    
    private func configureAppearance() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.view.backgroundColor = .white
        
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
        
        let heartButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "antonHeart"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFill
            button.tintColor = UIColor(hexString: "97D5C8")
            return button
        }()
        
        heartButton.addTarget(self, action: #selector(heartAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: heartButton)
        
        slider.configure(lowerValue: 0.3, upperValue: 0.7)
        slider.addTarget(self, action: #selector(sliderAction(_:)), for: .valueChanged)
    }
}

@objc extension AntonNavigationController {
    private func heartAction() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
    
    private func sliderAction(_ sender: Any) {
        print((sender as! AntonDoubleSliderControl).lowerValue, (sender as! AntonDoubleSliderControl).upperValue)
    }
}
