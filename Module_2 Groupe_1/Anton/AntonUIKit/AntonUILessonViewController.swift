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
    private let personalDetails = UILabel(font: UIFont(name: "Poppins-SemiBold", size: 18), text: "Personal details")
    private let antonPersonalInfo = AntonPersonalInfoView()
    private let infoCircle = AntonPersonalAboutView()
    private let bookmark = AntonPersonalSettingsView()
    private let bell = AntonPersonalSettingsView()
    private let gearshape = AntonPersonalSettingsView()
    private let creditcard = AntonPersonalSettingsView()

    private let stackViewSetting: UIStackView = {
        let view = UIStackView()
        view.spacing = 14
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private let chevronTop = AntonPersonalConnectionView()
    private let chevronMiddleTop = AntonPersonalConnectionView()
    private let chevronMiddleBottom = AntonPersonalConnectionView()
    private let chevronBottom = AntonPersonalConnectionView()
    
    private let stackViewConnection: UIStackView = {
        let view = UIStackView()
        view.spacing = 19
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private let buttonUpdate: UIButton = {
        let button = UIButton(
            backgroundColor: UIColor(hexString: "F8774A"),
            titleColor: UIColor(hexString: "F6F6F9"),
            title: "Update"
        )
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 17)
        return button
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        
        let strText = """
                    Send Feedback
                    Report an Emergency
                    Rate us on the Play Store
                    Log Out
                    """
        let indent = NSMutableParagraphStyle()
        indent.lineSpacing = 11
        let attributedStr = NSMutableAttributedString(string: strText)
        attributedStr.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: indent,
            range: NSMakeRange(0, attributedStr.length)
        )
        
        textView.attributedText = attributedStr
        textView.font = UIFont(name: "Poppins-Regular", size: 17)
        return textView
    }()
        
    private let buttonEdit: UIButton = {
        let button = UIButton(backgroundColor: .clear, titleColor: UIColor(hexString: "FA4A0C") , title: "Edit")
        button.titleLabel?.font = UIFont(name: "Metropolis-Regular", size: 15)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        configureAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        DispatchQueue.main.async {
            self.buttonUpdate.layer.cornerRadius = self.buttonUpdate.frame.height / 2
        }
    }
    
    private func configureAppearance() {
        
        let antonPersonalInfoViewModel = AntonPersonalInfoView.ViewModel(
            image: UIImage(named: "antonAvatar"),
            name: "Sumanya K.",
            email: "sumanyak@gmail.com",
            phone: "+91 xxxxxxxxxxx",
            address: "#21-22-31, Masab Tank, Hyderabad."
        )
        antonPersonalInfo.configure(with: antonPersonalInfoViewModel)
        
        let bookmarksSettings = AntonPersonalSettingsView.ViewModel(image: UIImage(systemName: "bookmark"),
                                                                    title: "Bookmarks")
        bookmark.configure(with: bookmarksSettings)
        let bellSettings = AntonPersonalSettingsView.ViewModel(image: UIImage(systemName: "bell"),
                                                               title: "Notifications")
        bell.configure(with: bellSettings)
        let gearshapeSettings = AntonPersonalSettingsView.ViewModel(image: UIImage(systemName: "gearshape"),
                                                                    title: "Settings")
        gearshape.configure(with: gearshapeSettings)
        let creditcardSettings = AntonPersonalSettingsView.ViewModel(image: UIImage(systemName: "creditcard"),
                                                                     title: "Payments")
        creditcard.configure(with: creditcardSettings)
        
        let chevronTopConnection = AntonPersonalConnectionView.ViewModel(title: "Your Orders")
        chevronTop.configure(with: chevronTopConnection)
        let chevronMiddleTopConnection = AntonPersonalConnectionView.ViewModel(title: "Feedback & Refunds")
        chevronMiddleTop.configure(with: chevronMiddleTopConnection)
        let chevronMiddleBottomConnection = AntonPersonalConnectionView.ViewModel(title: "My Preferences")
        chevronMiddleBottom.configure(with: chevronMiddleBottomConnection)
        let chevronBottomConnection = AntonPersonalConnectionView.ViewModel(title: "Help")
        chevronBottom.configure(with: chevronBottomConnection)
        let infoCircleAbout = AntonPersonalAboutView.ViewModel(title: "About")
        infoCircle.configure(with: infoCircleAbout)
        
        [
            bookmark,
            bell,
            gearshape,
            creditcard
        ].forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingsHandler(_ :))))
        }
        
        stackViewSetting.subviews.forEach {
            ($0 as? UIView)?.backgroundColor = .white
        }
        
        [
            chevronTop,
            chevronMiddleTop,
            chevronMiddleBottom,
            chevronBottom,
            infoCircle
        ].forEach {
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(connectionHandler(_ :))))
        }
        
        stackViewConnection.subviews.forEach {
            ($0 as? UIView)?.backgroundColor = .white
        }
        
        buttonUpdate.addTarget(self, action: #selector(buttonUpdateAction), for: .touchUpInside)
        personalDetails.textColor = .black
        antonPersonalInfo.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(personalInfoHandler
                             )))
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.showsVerticalScrollIndicator = false

        [
            stackViewSetting,
            stackViewConnection,
            antonPersonalInfo,
            infoCircle,
            buttonUpdate,
            textView,
            personalDetails,
            buttonEdit
        ].forEach(contentView.addSubview)
        
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
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        stackViewSetting.snp.makeConstraints {
            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        [
            bookmark,
            bell,
            gearshape,
            creditcard
        ].forEach { view in
            view.snp.makeConstraints {
                $0.height.equalTo(54)
            }
        }
        
        stackViewConnection.snp.makeConstraints {
            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(115)
            $0.leading.trailing.equalToSuperview().inset(25)
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
        }
        
        infoCircle.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(614)
            $0.leading.equalToSuperview().inset(33)
            $0.trailing.equalToSuperview().inset(238)
            infoCircle.backgroundColor = .white
        }
        
        buttonUpdate.snp.makeConstraints {
            $0.top.equalTo(antonPersonalInfo.snp.bottom).offset(704)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(121)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(stackViewConnection.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(44)
        }
        
        personalDetails.snp.makeConstraints {
            $0.top.equalToSuperview().inset(43)
            $0.leading.equalToSuperview().inset(42)
        }
        
        buttonEdit.snp.makeConstraints {
            $0.top.equalToSuperview().inset(43)
            $0.trailing.equalToSuperview().inset(54)
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
        case infoCircle: controller.view.backgroundColor = .purple
        default: break
        }
        present(controller, animated: true)
    }
    
    private func buttonUpdateAction() {
        let controller = UIViewController()
        controller.view.backgroundColor = .orange
        present(controller, animated: true)
    }
    
    private func personalInfoHandler() {
        let controller = AntonAuthViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
