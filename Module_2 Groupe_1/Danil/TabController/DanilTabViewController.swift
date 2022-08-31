//
//  DanilTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit

final class DanilTabViewController: UIViewController {

    @IBOutlet weak var inCodeLayoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }
    
    @IBAction func inCodeLayourButtonHandler(_ sender: Any) {
        let controller = InCodeLayoutController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
}

