//
//  TabBarController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case valery
    case dmitry
    case evgeny
    case danil
    case anton

    var controller: UIViewController? {
        switch self {
        case .valery:
            let controller = UIStoryboard(name: "ValeryTabStoryboard", bundle: nil)
                .instantiateViewController(withIdentifier: "ValeryTab")
            controller.tabBarItem = UITabBarItem(title: "Valery",
                                                 image: UIImage(systemName: "person"),
                                                 tag: rawValue)
            return controller
        case .dmitry:
            let controller = UIStoryboard(name: "DmitryTabStoryboard", bundle: nil)
                .instantiateViewController(withIdentifier: "DmitryTab")
            controller.tabBarItem = UITabBarItem(title: "Dmitry",
                                                 image: UIImage(systemName: "person"),
                                                 tag: rawValue)
            return controller
        case .evgeny:
            let controller = UIStoryboard(name: "EvgenyTabStoryboard", bundle: nil)
                .instantiateViewController(withIdentifier: "EvgenyTab")
            controller.tabBarItem = UITabBarItem(title: "Evgeny",
                                                 image: UIImage(systemName: "person"),
                                                 tag: rawValue)
            return controller
        case .danil:
            let controller = UIStoryboard(name: "DanilTabStoryboard", bundle: nil)
                .instantiateViewController(withIdentifier: "DanilTab")
            controller.tabBarItem = UITabBarItem(title: "Danil",
                                                 image: UIImage(systemName: "person"),
                                                 tag: rawValue)
            return controller
        case .anton:
            let controller = UIStoryboard(name: "AntonTabStoryboard", bundle: nil)
                .instantiateViewController(withIdentifier: "AntonTab")
            controller.tabBarItem = UITabBarItem(title: "Anton",
                                                 image: UIImage(systemName: "person"),
                                                 tag: rawValue)
            return controller
        }
    }
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureAppearance()
    }

    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }

    private func configureAppearance() {
        tabBar.tintColor = .blue
        tabBar.barTintColor = .lightGray
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 1

        let controllers = Tabs.allCases.compactMap { $0.controller }

        setViewControllers(controllers, animated: false)
    }
}
