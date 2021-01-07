//
//  FavouritesViewController.swift
//  someProject
//
//  Created by Koko on 10/28/20.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var products = [Data](){
        didSet{
            DispatchQueue.main.async {
                self.tableViewF.reloadData()
            }
        }
    }
    @IBOutlet weak var tableViewF: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewF.delegate = self
        self.tableViewF.dataSource = self
        self.tableViewF.register(UINib(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouritesTableViewCell")
        self.getProducts()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
        let product = products[indexPath.row]
//        print("product.name: \(product.name)")
        cell.nameFProduct.text = product.name!
        downloadImage(urlstr: product.image ?? "", imageView: cell.imageFProduct!)
        return cell
    }
    func getProducts(){
        Favourites.sharedInstance.array[EmailPass.sharedInstance.passEmail!] = Favourites.sharedInstance.arr
        for (key, value) in Favourites.sharedInstance.array {
            print("key: \(key)")
//            value.forEach{(p) in
                self.products = value
//            }
        }
        self.tableViewF.reloadData()
            
        }
    
    func downloadImage(urlstr: String, imageView: UIImageView) {
        let url = URL(string: urlstr)!
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}


