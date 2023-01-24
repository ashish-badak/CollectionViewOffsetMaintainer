//
//  ColorPaletteCollectionViewDelegate.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 24/01/23.
//

import Foundation
import UIKit

final class ColorPaletteCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private let data: [Section]
    
    enum Spacings {
        static let itemSpacing: CGFloat = 16
        static let edgeInsets: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    private let collectionViewOffsetMaintainer: CollectionViewOffsetMaintainer
    
    init(data: [Section]) {
        self.data = data
        collectionViewOffsetMaintainer = CollectionViewOffsetMaintainer(defaultOffset: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = collectionView.frame.size.width
        return CGSize(
            width: dimension,
            height: 300 + Spacings.edgeInsets.top + Spacings.edgeInsets.bottom
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Spacings.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionViewOffsetMaintainer.willDisplay(cell, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionViewOffsetMaintainer.didEndDisplaying(cell, at: indexPath)
    }
}
