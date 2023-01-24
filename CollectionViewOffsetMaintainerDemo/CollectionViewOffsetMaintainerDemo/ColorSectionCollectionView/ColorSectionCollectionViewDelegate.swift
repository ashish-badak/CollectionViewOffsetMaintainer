//
//  ColorSectionCollectionViewDelegate.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 24/01/23.
//

import Foundation
import UIKit

final class ColorSectionCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var colors: [UIColor]
    
    enum Spacings {
        static let itemSpacing: CGFloat = 16
        static let edgeInsets: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    init(colors: [UIColor] = []) {
        self.colors = colors
    }
    
    func set(colors: [UIColor]) {
        self.colors = colors
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Spacings.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Spacings.edgeInsets
    }
}
