//
//  ViewController.swift
//  PortfolioDemo
//
//  Created by BBU on 23/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!{
        didSet{
            self.userTableView.delegate = self
            self.userTableView.dataSource = self
        }
    }
    let getItem: GetItem = GetItem()
    var users: [Users] = [Users]()
    var offSet: Int = 10
    var limit: Int = 10
    let reuseIdentifier: String = "cell"
    var isOdd: Bool = true
    var count: Int = 0
    var isMore: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMore()
    }
    
    func loadMore(){
        getItem.getItems(offSet, limit: limit, completionHandler:{ (res) in
            if let usersResult = res.users, let more = res.has_more{
                self.users.append(contentsOf:usersResult)
                self.isMore = more
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
            }
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = userTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell{
            cell.user = self.users[indexPath.row]
            cell.row = indexPath.row
            cell.setImage()
            cell.setUserName()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0.0
        if ((self.users[indexPath.row].items?.count ?? 0) % 2) == 0 {
            let size = (self.userTableView.frame.size.width / 2.0)
            let numberItem = CGFloat(self.users[indexPath.row].items!.count)
            height =  size * (numberItem / 2.0) + 100.0
        }
        else{
            let numberItem = CGFloat(self.users[indexPath.row].items!.count)
            if numberItem > 1{
                height = self.userTableView.frame.size.width + (self.userTableView.frame.size.width / 2.0) * (numberItem / 2.0) + 100.0
            }
            else{
                height = self.userTableView.frame.size.width + (numberItem / 2.0) + 100.0
            }
        }
        return height
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if (self.users.count - 1) == indexPath.row && isMore{
//            self.offSet = offSet + 10
//            self.limit = 10
//            self.loadMore()
//        }
//    }
}


