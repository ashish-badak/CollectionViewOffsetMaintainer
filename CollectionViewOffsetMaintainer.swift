//
//  CollectionViewOffsetMaintainer.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 24/01/23.
//

import Foundation
import UIKit

protocol CollectionViewOffsetMaintaining: AnyObject {
    var collectionView: UICollectionView { get }
    var collectionViewOffset: CGFloat { get set }
}

extension CollectionViewOffsetMaintaining {
    var collectionViewOffset: CGFloat {
        get { collectionView.contentOffset.x }
        set { collectionView.contentOffset.x = newValue }
    }
}

final class CollectionViewOffsetMaintainer {
    var collectionViewOffsets: [AnyHashable: CGFloat]
    var defaultOffset: CGFloat
    
    init(offsetDefaults: [AnyHashable: CGFloat], defaultOffset: CGFloat) {
        collectionViewOffsets = offsetDefaults
        self.defaultOffset = defaultOffset
    }
    
    convenience init(defaultOffset: CGFloat) {
        self.init(offsetDefaults: [:], defaultOffset: defaultOffset)
    }
    
    func willDisplay(_ view: UICollectionViewCell, at index: AnyHashable) {
        if let view = view as? CollectionViewOffsetMaintaining {
            view.collectionViewOffset = collectionViewOffsets[index] ?? -defaultOffset
        }
    }
    
    func didEndDisplaying(_ view: UICollectionViewCell, at index: AnyHashable) {
        if let view = view as? CollectionViewOffsetMaintaining {
            collectionViewOffsets[index] = view.collectionViewOffset
        }
    }
}
