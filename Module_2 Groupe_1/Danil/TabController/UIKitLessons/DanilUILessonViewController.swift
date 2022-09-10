//
//  DanilUILessonViewController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 06.09.2022.
//

import UIKit

final class DanilUILessonViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView(backgroundColor: Constants.Color.primary)
    
    private let personalDetailsLabel = UILabel(font: .poppinsSemiBold18, text: "Personal details")
    
    private let editButton: UIButton = {
        let button = UIButton(backgroundColor: .clear, titleColor: Constants.Color.secondary, title: "Edit")
        button.titleLabel?.font = UIFont.metropolisRegular15
        return button
    }()
    
    private let personalInfoView = DanilPersonalInfoView()
    
    private let categoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.UILessonSpacing.basic
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let bookmarksCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "bookmark")), labelText: "Bookmarks")
    private let notificationsCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "bell")), labelText: "Notifications")
    private let settingsCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "gearshape")), labelText: "Settings")
    private let paymentsCategory = DanilCategoryView(categoryImageView: UIImageView(image: UIImage(systemName: "creditcard")), labelText: "Payments")
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.UILessonSpacing.medium
        stackView.axis = .vertical
        return stackView
    }()
    
    private let orderMenuItemView = DanilMenuItemView(textLabel: "Your Orders")
    private let feedbackMenuItemView = DanilMenuItemView(textLabel: "Feedback & Refunds")
    private let preferencesMenuItemView = DanilMenuItemView(textLabel: "My Preferences")
    private let helpMenuItemView = DanilMenuItemView(textLabel: "Help")
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        
        let str = """
                    Send Feedback
                    Report an Emergency
                    Rate us on the Play Store
                    Log Out
                    """
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 13
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraph,
            range: NSMakeRange(0, attributedString.length)
        )
        textView.attributedText = attributedString
        textView.font = .poppinsRegular17
        return textView
    }()
    
    private let additionalInfoView: DanilBaseView = {
        let baseView = DanilAdditionalInfoView()
        baseView.layer.cornerRadius = Constants.BorderRadius.medium
        return baseView
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(
            backgroundColor: Constants.Color.secondary,
            titleColor: Constants.Color.buttonTitle,
            title: "Update"
        )
        button.titleLabel?.font = UIFont.poppinsSemiBold17
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.async {
            self.updateButton.layer.cornerRadius = self.updateButton.frame.height / 2
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = Constants.Color.primary
        
        let personalInfoViewModel = DanilPersonalInfoView.ViewModel(avatarUrlString: "danilAvatar", name: "Sumanya K.", email: "sumanyak@gmail.com", phone: "+91 xxxxxxxxxxx", address: "#21-22-31, Masab Tank, Hyderabad.")
        personalInfoView.configure(with: personalInfoViewModel)
        
        [bookmarksCategory, notificationsCategory, settingsCategory, paymentsCategory]
            .forEach {
                $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(categoriesHandler(_:))))
            }
        
        [orderMenuItemView, feedbackMenuItemView, preferencesMenuItemView, helpMenuItemView]
            .forEach {
                $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(menuHandler(_:))))
            }
        
        additionalInfoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(additionalInfoHandler)))
        
        personalInfoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(personalInfoHandler)))
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [
            personalDetailsLabel,
            editButton,
            personalInfoView,
            categoriesStackView,
            menuStackView,
            textView,
            additionalInfoView,
            updateButton
        ].forEach(contentView.addSubview)
        
        [bookmarksCategory,
         notificationsCategory,
         settingsCategory,
         paymentsCategory
        ].forEach(categoriesStackView.addArrangedSubview)
        
        [
            orderMenuItemView,
            feedbackMenuItemView,
            preferencesMenuItemView,
            helpMenuItemView
        ].forEach(menuStackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view)
        }
        
        personalDetailsLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(Constants.UILessonPadding.large)
        }
        
        editButton.snp.makeConstraints {
            $0.trailing.top.equalToSuperview().inset(Constants.UILessonPadding.large)
        }
        
        personalInfoView.snp.makeConstraints {
            $0.top.equalTo(personalDetailsLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(Constants.UILessonPadding.basic)
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
        
        textView.snp.makeConstraints {
            $0.top.equalTo(menuStackView.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(44)
        }
        
        additionalInfoView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Constants.UILessonPadding.medium)
            $0.top.equalTo(textView.snp.bottom).offset(31)
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
        let controller = UIViewController()
        switch gestureRecognizer.view {
        case bookmarksCategory: controller.view.backgroundColor = .white
        case notificationsCategory: controller.view.backgroundColor = .blue
        case settingsCategory: controller.view.backgroundColor = .red
        case paymentsCategory: controller.view.backgroundColor = .brown
        default: return
        }
        present(controller, animated: true)
    }
    
    private func menuHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        let controller = UIViewController()
        switch gestureRecognizer.view {
        case orderMenuItemView: controller.view.backgroundColor = .white
        case feedbackMenuItemView: controller.view.backgroundColor = .blue
        case preferencesMenuItemView: controller.view.backgroundColor = .red
        case helpMenuItemView: controller.view.backgroundColor = .brown
        default: break
        }
        present(controller, animated: true)
    }
    
    private func additionalInfoHandler() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
    
    private func personalInfoHandler() {
        let danilAuthController = DanilAuthViewController()
        danilAuthController.modalPresentationStyle = .fullScreen
        present(danilAuthController, animated: true)
    }
}

private extension Constants {
    enum UILessonPadding {
        static let basic = 25
        static let medium = 35
        static let large = 43
    }
    
    enum UILessonSpacing {
        static let basic: CGFloat = 14
        static let medium: CGFloat = 19
    }
    
    static let additionalInfoSize = CGSize(width: 143, height: 40)
}
