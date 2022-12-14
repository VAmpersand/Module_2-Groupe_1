//
//  DanilEmptyCell.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 02.10.2022.
//

import UIKit

final class DanilEmptyCell: UICollectionViewCell {
    
    static let id = "emptyId"
    static func size(with height: CGFloat) -> CGSize {
        return CGSize(width: 0, height: height)
    }
}
