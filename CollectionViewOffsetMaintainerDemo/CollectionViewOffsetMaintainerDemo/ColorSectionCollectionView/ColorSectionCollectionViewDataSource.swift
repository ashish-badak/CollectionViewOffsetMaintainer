//
//  ColorSectionCollectionViewDataSource.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 24/01/23.
//

import Foundation
import UIKit

final class ColorSectionCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private var colors: [UIColor]
    
    init(colors: [UIColor] = []) {
        self.colors = colors
    }
    
    func set(colors: [UIColor]) {
        self.colors = colors
    }
    
    func registerViews(for collectionView: UICollectionView) {
        collectionView.register(
            ColoredCollectionViewCell.self,
            forCellWithReuseIdentifier: ColoredCollectionViewCell.reuseIdentifier
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ColoredCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? ColoredCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let color = colors[indexPath.item]
        cell.set(color: color)
        return cell
    }
}
