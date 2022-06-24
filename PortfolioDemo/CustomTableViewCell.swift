//
//  CustomTableViewCell.swift
//  PortfolioDemo
//
//  Created by BBU on 24/06/22.
//

import UIKit
import SDWebImage
class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var usersCollectionView: UICollectionView!{
        didSet{
            self.usersCollectionView.delegate = self
            self.usersCollectionView.dataSource = self
            self.usersCollectionView.isScrollEnabled = false
        }
    }
    
    @IBOutlet var userImg: UIImageView!
    var user: Users?
    var itemCount: Int = 0
    var row: Int = 0
    
    func setImage() {
        
        self.userImg.sd_setImage(with: URL(string: user?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.userImg.backgroundColor = .systemYellow
       
       // self.img.image = UIImage(named: "")
    }
    
    func setUserName(){
        self.userNameLabel.text = user?.name
       // usersCollectionView.reloadData()
    }
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.user?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? CustomCollectionViewCell{
           
                cell.setImage(name: self.user?.items?[indexPath.item] ?? "")
                return cell
            
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imgWidth = UIScreen.main.bounds.size.width - 15
        if ((self.user?.items?.count ?? 0) % 2) == 0{
            
            return CGSize(width: (imgWidth - 15) / 2, height: (imgWidth - 15) / 2)
        }
        else{
            if indexPath.item == 0{
                return CGSize(width: (imgWidth - 15), height: (imgWidth - 15))
            }
            else{
                return CGSize(width: (imgWidth - 15) / 2, height: (imgWidth - 15) / 2)
            }
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}
