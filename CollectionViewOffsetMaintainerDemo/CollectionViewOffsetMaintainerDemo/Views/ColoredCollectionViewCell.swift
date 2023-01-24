//
//  ColoredCollectionViewCell.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 23/01/23.
//

import UIKit

final class ColoredCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String { "ColoredCollectionViewCell" }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 16
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(color: UIColor) {
        self.backgroundColor = color
    }
}
