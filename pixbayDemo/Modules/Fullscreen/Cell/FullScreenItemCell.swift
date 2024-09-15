//
//  FullScreenItemCell.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 15.09.2024.
//

import UIKit

class FullScreenItemCell: UICollectionViewCell {
    public static let cellIdentifier = "fullScreenItem"
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.image = UIImage(systemName: "person.circle.fill")
    }

    public static func register(in collectionView: UICollectionView?) {
        collectionView?.register(UINib(nibName: "FullScreenItemCell", bundle: nil), forCellWithReuseIdentifier: Self.cellIdentifier)
    }
}
