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
    
    enum HeaderType {
        case main(item: DanilOrderMainHeader.CellConfig)
    }
        
    struct Section {
        let header: HeaderType?
        let items: [CellType]
    }
    
    struct OrderConfig {
        let sections: [Section]
    }
    
    let dataSource: OrderConfig = .init(
        sections: [
            .init(header: .main(item: .init(amountOfItemsInCart: 2)), items: [
                .empty(height: 16)
            ]),
            .init(header: nil, items: [
                .address(item: .init(
                    place: "Satya Nilayam", address: "21-42-34, Banjara Hills, Hyderabad, 500072", scheduledTime: 30)),
                .empty(height: 20)
            ]
            ),
            .init(header: nil, items: [
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
            .init(header: nil, items: [
                .promo,
                .empty(height: 30)
            ]),
            .init(header: nil, items: [
                .totalPrice(item: .init(deliveryPrice: 40, subtotalPrice: 500)),
                .empty(height: 25)
            ]),
            .init(header: nil, items: [
                .primaryButton(item: .init(title: "Payment")),
                .empty(height: 30)
            ]),
            .init(header: nil, items: [
                .primaryButton(item: .init(title: "Select User")),
                .empty(height: 40)
            ])
        ]
    )
}
