//
//  FullScreenViewController.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 14.09.2024.
//

import UIKit

final class FullScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        FullScreenItemCell.register(in: collectionView)
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = UIScreen.main.bounds.size
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    @IBAction func closeDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension FullScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullScreenItemCell.cellIdentifier, for: indexPath)
        return cell
    }
    
}
