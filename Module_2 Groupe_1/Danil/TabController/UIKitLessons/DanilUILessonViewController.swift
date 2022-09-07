//
//  DanilUILessonViewController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilUILessonViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView(backgroundColor: UIColor(hexString: Constants.Color.mainBackground))
    
    private let personalInfoView: DanilBaseView = {
        let baseView = DanilPersonalInfoView()
        baseView.layer.cornerRadius = Constants.BorderRadius.medium
        return baseView
    }()
    
    private let categoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.UILessonSpacing.basic
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let bookmarksCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "bookmark")))
    private let notificationsCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "bell")))
    private let settingsCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "gearshape")))
    private let paymentsCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "creditcard")))
    
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.UILessonSpacing.medium
        stackView.axis = .vertical
        return stackView
    }()
    
    private let orderMenuItemView = DanilMenuItemView()
    private let feedbackMenuItemView = DanilMenuItemView()
    private let preferencesMenuItemView = DanilMenuItemView()
    private let helpMenuItemView = DanilMenuItemView()
    
    private let additionalInfoView: DanilBaseView = {
        let baseView = DanilAdditionalInfoView()
        baseView.layer.cornerRadius = Constants.BorderRadius.medium
        return baseView
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(
            backgroundColor: UIColor(hexString: Constants.Color.mainButtonBackround),
            titleColor: UIColor(hexString: Constants.Color.mainButtonTitle),
            title: "Update"
        )
        button.layer.cornerRadius = Constants.BorderRadius.large
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.FontSize.medium)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        addConstraints()
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: Constants.Color.mainBackground)
        [bookmarksCategory, notificationsCategory, settingsCategory, paymentsCategory]
            .forEach {
                $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(categoriesHandler(_:))))
            }
        
        [orderMenuItemView, feedbackMenuItemView, preferencesMenuItemView, helpMenuItemView]
            .forEach {
                $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(menuHandler(_:))))
            }
        
        additionalInfoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(additionalInfoHandler)))
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [personalInfoView, categoriesStackView, menuStackView, additionalInfoView, updateButton]
            .forEach { contentView.addSubview($0) }
        [bookmarksCategory, notificationsCategory, settingsCategory, paymentsCategory]
            .forEach { categoriesStackView.addArrangedSubview($0) }
        [orderMenuItemView, feedbackMenuItemView, preferencesMenuItemView, helpMenuItemView]
            .forEach { menuStackView.addArrangedSubview($0) }
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
        }
        
        personalInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(95)
            $0.leading.trailing.equalToSuperview().inset(Constants.UILessonPadding.basic)
            $0.height.equalTo(155)
        }
        
        categoriesStackView.snp.makeConstraints {
            $0.top.equalTo(personalInfoView.snp.bottom).offset(Constants.UILessonPadding.basic)
            $0.leading.trailing.equalToSuperview().inset(Constants.UILessonPadding.medium)
            $0.height.equalTo(54)
        }
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(categoriesStackView.snp.bottom).offset(Constants.UILessonPadding.medium)
            $0.leading.trailing.equalToSuperview().inset(Constants.UILessonPadding.basic)
        }
        
        additionalInfoView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Constants.UILessonPadding.medium)
            // fix then
            $0.top.equalTo(menuStackView.snp.bottom).offset(202)
            $0.size.equalTo(Constants.additionalInfoSize)
        }
        
        updateButton.snp.makeConstraints {
            $0.top.equalTo(additionalInfoView.snp.bottom).offset(62)
            $0.bottom.equalToSuperview().inset(121)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(Constants.Button.mediumSize)
        }
    }
}

@objc extension DanilUILessonViewController {
    private func categoriesHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        switch gestureRecognizer.view {
        case bookmarksCategory:
            let controller = UIViewController()
            controller.view.backgroundColor = .white
            present(controller, animated: true)
        case notificationsCategory:
            let controller = UIViewController()
            controller.view.backgroundColor = .blue
            present(controller, animated: true)
        case settingsCategory:
            let controller = UIViewController()
            controller.view.backgroundColor = .red
            present(controller, animated: true)
        case paymentsCategory:
            let controller = UIViewController()
            controller.view.backgroundColor = .brown
            present(controller, animated: true)
        default:
            break
        }
    }
    
    private func menuHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        switch gestureRecognizer.view {
        case orderMenuItemView:
            let controller = UIViewController()
            controller.view.backgroundColor = .white
            present(controller, animated: true)
        case feedbackMenuItemView:
            let controller = UIViewController()
            controller.view.backgroundColor = .blue
            present(controller, animated: true)
        case preferencesMenuItemView:
            let controller = UIViewController()
            controller.view.backgroundColor = .red
            present(controller, animated: true)
        case helpMenuItemView:
            let controller = UIViewController()
            controller.view.backgroundColor = .brown
            present(controller, animated: true)
        default:
            break
        }
    }
    
    private func additionalInfoHandler() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
}

private extension Constants {
    enum UILessonPadding {
        static let basic = 25
        static let medium = 35
    }
    
    enum UILessonSpacing {
        static let basic: CGFloat = 14
        static let medium: CGFloat = 19
    }
    
    static let additionalInfoSize = CGSize(width: 143, height: 40)
}
