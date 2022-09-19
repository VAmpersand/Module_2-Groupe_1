//
//  PickerTextField.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 17.09.2022.
//

import UIKit

final class PickerTextField: BaseTextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
