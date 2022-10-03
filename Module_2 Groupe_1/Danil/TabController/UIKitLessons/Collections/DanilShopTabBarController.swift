//
//  DanilShopTabBarController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.10.2022.
//

import UIKit

enum DanilTabs: Int {
    case discover
    case favourites
    case cart
    case user
}

final class DanilShopTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
        configureTabs()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureAppearance()
        configureTabs()
    }
    
    override func viewWillLayoutSubviews() {
        tabBar.itemPositioning = .centered
    }
    
    override func viewDidLayoutSubviews() {
        tabBar.itemPositioning = .centered
    }

    private func configureAppearance() {
        tabBar.tintColor = .blue
        tabBar.backgroundColor = .white
        tabBar.layer.shadowColor = Constants.Color.secondary.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 7
    }
    
    private func configureTabs() {
        let discoverController = UIViewController()
        discoverController.view.backgroundColor = .white
        let favouritesController = UIViewController()
        favouritesController.view.backgroundColor = .lightGray
        let danilCollectionDemoController = DanilCollectionDemoController()
        let userController = UIViewController()
        userController.view.backgroundColor = .purple
        
        discoverController.tabBarItem = UITabBarItem(title: nil,
                                                     image: Constants.Images.TaBar.discover,
                                                     tag: DanilTabs.discover.rawValue)
        favouritesController.tabBarItem = UITabBarItem(title: nil,
                                                       image: Constants.Images.TaBar.favourites,
                                                       tag: DanilTabs.favourites.rawValue)
        danilCollectionDemoController.tabBarItem = UITabBarItem(title: nil,
                                                                image: Constants.Images.TaBar.cart,
                                                                tag: DanilTabs.cart.rawValue)
        userController.tabBarItem = UITabBarItem(title: nil,
                                                 image: Constants.Images.TaBar.user,
                                                 tag: DanilTabs.user.rawValue)
        setViewControllers([
            discoverController,
            favouritesController,
            danilCollectionDemoController,
            userController
        ], animated: false)
    }
}
