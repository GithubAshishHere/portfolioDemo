//
//  CustomCollectionViewCell.swift
//  PortfolioDemo
//
//  Created by BBU on 23/06/22.
//

import UIKit
import SDWebImage
class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var img: UIImageView!
    func setImage(name: String) {
        self.img.contentMode = .scaleAspectFit
        self.img.sd_setImage(with: URL(string: name), placeholderImage: UIImage(named: "placeholder.png"))
        self.img.backgroundColor = .blue
       // self.img.image = UIImage(named: "")
    }
}

