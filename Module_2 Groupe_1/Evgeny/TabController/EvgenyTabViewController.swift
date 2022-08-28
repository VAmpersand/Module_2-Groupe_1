//
//  EvgenyTabViewController.swift
//  Module_2 Groupe_1
//
//  Created by Viktor Prikolota on 20.08.2022.
//

import UIKit
import SnapKit

final class EvgenyTabViewController: UIViewController {

    @IBOutlet weak var intefaceBulderButton: UIButton!
    
    private let inCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("InCode layout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    private let inCodeButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("InCode layout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        view.addSubview(intefaceBulderButton)
        
        inCodeButton.translatesAutoresizingMaskIntoConstraints = false
        inCodeButton2.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
}

