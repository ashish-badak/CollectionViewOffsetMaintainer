//
//  ViewController.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 23/01/23.
//

import UIKit

class ViewController: UIViewController {
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let collectionViewDataSource = ColorPaletteCollectionViewDataSource(data: Section.allCases)
    private let collectionViewDelegate = ColorPaletteCollectionViewDelegate(data: Section.allCases)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = collectionViewDataSource
        collectionViewDataSource.registerViews(for: collectionView)
        collectionView.delegate = collectionViewDelegate
    }
}


