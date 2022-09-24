//
//  UIFont + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 09.09.2022.
//

import UIKit

extension UIFont {
    static let metropolisMedium21 = UIFont(name: "Metropolis-Medium", size: 21)
    static let nunitoRegular16 = UIFont(name: "Nunito-Regular", size: 16)
    static let robotoMedium17 = UIFont(name: "Roboto-Medium", size: 17)
    static let poppinsMedium15 = UIFont(name: "Poppins-Medium", size: 15)
    
    static func getPoppinsRegular(with size: CGFloat) -> UIFont {
        UIFont(name: "Poppins-Regular", size: size) ?? UIFont()
    }

    static func getPoppinsSemiBold(with size: CGFloat) -> UIFont {
        UIFont(name: "Poppins-SemiBold", size: size) ?? UIFont()
    }
    
    static func getMetropolisRegular(with size: CGFloat) -> UIFont {
        UIFont(name: "Metropolis-Regular", size: size) ?? UIFont()
    }
}
