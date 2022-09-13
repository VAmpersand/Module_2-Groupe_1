//
//  AntonUILessonViewController.swift
//  Module_2 Groupe_1
//
//  Created by air on 10.09.2022.
//

import UIKit
import SnapKit

final class AntonUILessonViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView(backgroundColor: UIColor(hexString: "F5F5F8"))
    
    private let antonPersonalInfo = AntonPersonalInfo()
    private let bookmark = AntonPersonalSettings()
    private let bell = AntonPersonalSettings()
    private let gearshape = AntonPersonalSettings()
    private let creditcard = AntonPersonalSettings()
    private let stackViewSetting: UIStackView = {
        let view = UIStackView()
        view.spacing = 14
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private let chevronTop = AntonPersonalConnection()
    private let chevronMiddleTop = AntonPersonalConnection()
    private let chevronMiddleBottom = AntonPersonalConnection()
    private let chevronBottom = AntonPersonalConnection()
    private let stackViewConnection: UIStackView = {
        let view = UIStackView()
        view.spacing = 19
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private let infoCircle = AntonPersonalAbout()
    private let buttonUpdate = UIButton(backgroundColor: UIColor(hexString: "F8774A"), titleColor: .white, title: "Update")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonUpdate.layer.cornerRadius = buttonUpdate.frame.height / 2
    }
    
    private func configureAppearance() {
        
        let antonPersonalInfoViewModel = AntonPersonalInfo.ViewModel(image: UIImage(named: "antonAvatar"))
        antonPersonalInfo.configure(with: antonPersonalInfoViewModel)
        
        let bookmarksSettings = AntonPersonalSettings.ViewModel(image: UIImage(systemName: "bookmark"))
        bookmark.configure(with: bookmarksSettings)
        let bellSettings = AntonPersonalSettings.ViewModel(image: UIImage(systemName: "bell"))
        bell.configure(with: bellSettings)
        let gearshapeSettings = AntonPersonalSettings.ViewModel(image: UIImage(systemName: "gearshape"))
        gearshape.configure(with: gearshapeSettings)
        let creditcardSettings = AntonPersonalSettings.ViewModel(image: UIImage(systemName: "creditcard"))
        creditcard.configure(with: creditcardSettings)
        
        let chevronTopConnection = AntonPersonalConnection.ViewModel(image: UIImage(systemName: "chevron.right"))
        chevronTop.configure(with: chevronTopConnection)
        let chevronMiddleTopConnection = AntonPersonalConnection.ViewModel(image: UIImage(systemName: "chevron.right"))
        chevronMiddleTop.configure(with: chevronMiddleTopConnection)
        let chevronMiddleBottomConnection = AntonPersonalConnection.ViewModel(image: UIImage(systemName: "chevron.right"))
        chevronMiddleBottom.configure(with: chevronMiddleBottomConnection)
        let chevronBottomConnection = AntonPersonalConnection.ViewModel(image: UIImage(systemName: "chevron.right"))
        chevronBottom.configure(with: chevronBottomConnection)
        
        let infoCircleImage = AntonPersonalAbout.ViewModel(image: UIImage(systemName: "info.circle"))
        infoCircle.configure(with: infoCircleImage)
        
        [
            bookmark,
            bell,
            gearshape,
            creditcard
        ].forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingsHandler(_ :))))
        }
        
        [
            chevronTop,
            chevronMiddleTop,
            chevronMiddleBottom,
            chevronBottom
        ].forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(connectionHandler(_ :))))
        }
        
        infoCircle.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(aboutHandler)))
        buttonUpdate.addTarget(self, action: #selector(buttonUpdateAction), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(antonPersonalInfo)
        contentView.addSubview(stackViewSetting)
        contentView.addSubview(stackViewConnection)
        contentView.addSubview(infoCircle)
        contentView.addSubview(buttonUpdate)
        scrollView.showsVerticalScrollIndicator = false
        
        [
            bookmark,
            bell,
            gearshape,
            creditcard
        ].forEach(stackViewSetting.addArrangedSubview)
        
        [
            chevronTop,
            chevronMiddleTop,
            chevronMiddleBottom,
            chevronBottom
        ].forEach(stackViewConnection.addArrangedSubview)
    }
    
    private func addConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
        }
        
        antonPersonalInfo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(95)
            $0.left.right.equalToSuperview().inset(25)
        }
        
        stackViewSetting.snp.makeConstraints {
            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(25)
            $0.right.left.equalToSuperview().inset(40)
        
            stackViewSetting.subviews.forEach {
                ($0 as? UIView)?.backgroundColor = .white
            }
            
            [
                bookmark,
                bell,
                gearshape,
                creditcard
            ].forEach { view in
                view.snp.makeConstraints {
                    $0.height.equalTo(54)
                    $0.width.equalTo(75)
                }
                
                
                stackViewConnection.snp.makeConstraints {
                    $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(115)
                    $0.right.left.equalToSuperview().inset(25)
                    
                    stackViewConnection.subviews.forEach {
                        ($0 as? UIView)?.backgroundColor = .white
                    }
                    
                    [
                        chevronTop,
                        chevronMiddleTop,
                        chevronMiddleBottom,
                        chevronBottom
                    ].forEach { view in
                        view.snp.makeConstraints {
                            $0.height.equalTo(60)
                        }
                        
                        infoCircle.snp.makeConstraints {
                            $0.width.equalTo(143)
                            $0.height.equalTo(40)
                            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(614)
                            $0.left.equalToSuperview().inset(33)
                            $0.right.equalToSuperview().inset(238)
                            infoCircle.backgroundColor = .white
                        }
                        
                        buttonUpdate.snp.makeConstraints {
                            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(716)
                            $0.left.right.equalToSuperview().inset(50)
                            $0.height.equalTo(50)
                            $0.bottom.equalToSuperview().inset(120)
                        }
                    }
                }
            }
        }
    }
}

@objc extension AntonUILessonViewController {
    
   private func settingsHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        let controller = UIViewController()
        switch gestureRecognizer.view {
        case bookmark: controller.view.backgroundColor = .blue
        case bell: controller.view.backgroundColor = .red
        case gearshape: controller.view.backgroundColor = .gray
        case creditcard: controller.view.backgroundColor = .green
        default: break
        }
       present(controller, animated: true)
   }
    
    private func connectionHandler(_ gestureRecognizer: UITapGestureRecognizer) {
         let controller = UIViewController()
         switch gestureRecognizer.view {
         case chevronTop: controller.view.backgroundColor = .green
         case chevronMiddleTop: controller.view.backgroundColor = .gray
         case chevronMiddleBottom: controller.view.backgroundColor = .red
         case chevronBottom: controller.view.backgroundColor = .blue
         default: break
         }
        present(controller, animated: true)
    }
    
    private func aboutHandler() {
        let controller = UIViewController()
        controller.view.backgroundColor = .purple
        present(controller, animated: true)
    }
    
    private func buttonUpdateAction() {
        let controller = UIViewController()
        controller.view.backgroundColor = .orange
        present(controller, animated: true)
    }
}
