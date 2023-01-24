//
//  ColorPaletteCollectionViewDataSource.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 24/01/23.
//

import Foundation
import UIKit

final class ColorPaletteCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private let data: [Section]
    
    init(data: [Section]) {
        self.data = data
    }
    
    func registerViews(for collectionView: UICollectionView) {
        collectionView.register(
            ColorPaletteCollectionViewCell.self,
            forCellWithReuseIdentifier: ColorPaletteCollectionViewCell.reuseIdentifier
        )
        collectionView.register(
            SectionTitleView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionTitleView.reuseIdentifier
        )
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ColorPaletteCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? ColorPaletteCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.set(colors: data[indexPath.section].colors)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            assert(false, "Invalid element type")
        }

        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionTitleView.reuseIdentifier,
            for: indexPath
        )
        
        guard let typedHeaderView = headerView as? SectionTitleView else {
            return headerView
        }
        
        let title = data[indexPath.section].title
        typedHeaderView.set(title: title)
        return typedHeaderView
    }
}
