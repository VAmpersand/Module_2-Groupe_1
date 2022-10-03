//
//  DanilViewModel.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 30.09.2022.
//

import Foundation

final class DanilViewModel {
    enum CellType {
        case address(item: DanilMainOrderInfoCell.CellConfig)
        case position(item: DanilOrderPositionCell.CellConfig)
        case promo
        case totalPrice(item: DanilTotalPriceCell.CellConfig)
        case primaryButton(item: DanilPrimaryButtonCell.CellConfig)
        case empty(height: CGFloat)
    }
    
    struct MainHeaderConfig {
        let title: String
        let itemsInCart: UInt
    }
    
    struct Section {
        let items: [CellType]
    }
    
    struct OrderConfig {
        let mainHeaderConfig: MainHeaderConfig
        let sections: [Section]
    }
    
    let dataSource: OrderConfig = .init(
        mainHeaderConfig: .init(title: "Your order", itemsInCart: 2),
        sections: [
            .init(items: [
                .address(item: .init(
                    place: "Satya Nilayam", address: "21-42-34, Banjara Hills, Hyderabad, 500072", scheduledTime: 30)),
                .empty(height: 20)
            ]
            ),
            .init(items: [
                .position(item: .init(
                    imageName: "position-1",
                    dishName: "Fried Rice",
                    restaurantName: "Pista House",
                    userName: "User 1",
                    amount: 1,
                    price: 100)
                ),
                .empty(height: 15),
                .position(item: .init(
                    imageName: "position-2",
                    dishName: "Jollof Rice",
                    restaurantName: "Suhani’s Stop",
                    userName: "User 2",
                    amount: 1,
                    price: 125)
                ),
                .empty(height: 15),
                .position(item: .init(
                    imageName: "position-1",
                    dishName: "Biryani",
                    restaurantName: "Pista House",
                    userName: "User 3",
                    amount: 1,
                    price: 150)
                ),
                .empty(height: 15),
                .position(item: .init(
                    imageName: "position-2",
                    dishName: "Veg Pulao",
                    restaurantName: "Suhani’s Stop",
                    userName: "User 1",
                    amount: 1,
                    price: 125)
                ),
                .empty(height: 40)
            ]),
            .init(items: [
                .promo,
                .empty(height: 30)
            ]),
            .init(items: [
                .totalPrice(item: .init(deliveryPrice: 40, subtotalPrice: 500)),
                .empty(height: 25)
            ]),
            .init(items: [
                .primaryButton(item: .init(title: "Payment")),
                .empty(height: 30)
            ]),
            .init(items: [
                .primaryButton(item: .init(title: "Select User")),
                .empty(height: 40)
            ])
        ]
    )
}
