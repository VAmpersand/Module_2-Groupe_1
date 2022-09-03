//
//  UIViewController + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 01.09.2022.
//

import UIKit

extension UIViewController {
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate else { return nil }
        
        return sceneDelegate
    }
}
