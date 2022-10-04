//
//  AntonViewModel.swift
//  Module_2 Groupe_1
//
//  Created by air on 02.10.2022.
//

import UIKit

final class AntonViewModel {
    enum CellType {
        case banner(items: AntonBannerCell.CellConfig)
        case navigation(items: AntonNavigationCell.CellConfig)
        case promoCode
        case shoppingCart
        case buttons
    }
    
    struct Section {
        let headerConfig: AntonHeaderCell.HeaderConfig?
        let items: [CellType]
    }
    
    struct HeaderConfig {
        let backgroundColor: UIColor
        let title: String
        let subtitle: String
        let imageName: String
    }
    
    let dataSource: [Section] = [
        Section(
            headerConfig: .init(
                backgroundColor: .clear,
                title: "Your Order",
                subtitle: "2",
                imageName: "antonShopImage"
            ),
            items: [
                .banner( items: .init(
                    backgroundColor: UIColor(hexString: "FEEBC1"),
                    title: "Satya Nilayam",
                    subtitle: "21-42-34, Banjara Hills, Huderabad, 500072",
                    description: "30 mins"
                )),
            ]),
        Section(headerConfig: nil,
                items: [
                    .navigation(items: .init(
                        backgroundColor: .clear,
                        title: "Fried Rice",
                        subtitle: "Pista House",
                        description: "User 1",
                        imageNameFood: "antonFood_0",
                        imageNameStepper: "antonStepper",
                        imageNamePrice: "100price",
                        emptyNameCell: ""
                    )),
                    .navigation(items: .init(
                        backgroundColor: .clear,
                        title: "Jollof Rice",
                        subtitle: "Suhani's Stop",
                        description: "User 2",
                        imageNameFood: "antonFood_1",
                        imageNameStepper: "antonStepper",
                        imageNamePrice: "125price",
                        emptyNameCell: ""
                    )),
                    .navigation(items: .init(
                        backgroundColor: .clear,
                        title: "Biryani",
                        subtitle: "Pista House",
                        description: "User 3",
                        imageNameFood: "antonFood_0",
                        imageNameStepper: "antonStepper",
                        imageNamePrice: "150price",
                        emptyNameCell: ""
                    )),
                    .navigation(items: .init(
                        backgroundColor: .clear,
                        title: "Veg Pulao",
                        subtitle: "Suhani's Stop",
                        description: "User 4",
                        imageNameFood: "antonFood_1",
                        imageNameStepper: "antonStepper",
                        imageNamePrice: "125price",
                        emptyNameCell: ""
                    )),
                ]),
    ]
}

