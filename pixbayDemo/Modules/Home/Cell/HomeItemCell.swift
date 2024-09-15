//
//  HomeItemCell.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 14.09.2024.
//

import UIKit

final class HomeItemCell: UITableViewCell {

    public static let cellIdentifier = "homeItem"
    
    @IBOutlet weak var originalImageView: UIImageView!
    @IBOutlet weak var otherVariantImageView: UIImageView!
    @IBOutlet weak var tagsForOriginalImage: UILabel!
    @IBOutlet weak var tagsForOtherVariantImage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        tagsForOriginalImage.text = "BLA BLA BLA BLA"
        tagsForOtherVariantImage.text = "BLA BLA BLA BLA"
        originalImageView.image = UIImage(systemName: "person.circle.fill")
        otherVariantImageView.image = UIImage(systemName: "person.circle.fill")
    }
    
    public static func register(in tableView: UITableView?) {
        tableView?.register(UINib(nibName: "HomeItemCell", bundle: nil), forCellReuseIdentifier: Self.cellIdentifier)
    }
}
