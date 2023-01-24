//
//  ColorPaletteCollectionViewCell.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 24/01/23.
//

import UIKit

final class ColorPaletteCollectionViewCell: UICollectionViewCell, CollectionViewOffsetMaintaining {
    static var reuseIdentifier: String { "ColorPaletteCollectionViewCell" }
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var colors: [UIColor] = []
    private let collectionViewDataSource = ColorSectionCollectionViewDataSource()
    private let collectionViewDelegate = ColorSectionCollectionViewDelegate()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        collectionView.dataSource = collectionViewDataSource
        collectionViewDataSource.registerViews(for: collectionView)
        collectionView.delegate = collectionViewDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(colors: [UIColor]) {
        self.colors = colors
        collectionViewDataSource.set(colors: colors)
        collectionViewDelegate.set(colors: colors)
        collectionView.reloadData()
    }
}
