//
//  OrdersViewController.swift
//  someProject
//
//  Created by Koko on 10/28/20.
//

import UIKit

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
   
    var products = [Data](){
        didSet{
            DispatchQueue.main.async {
                self.tableViewO.reloadData()
            }
        }
    }
    

    @IBOutlet weak var tableViewO: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewO.delegate = self
        self.tableViewO.dataSource = self
        self.tableViewO.register(UINib(nibName: "PurchaseTableViewCell", bundle: nil), forCellReuseIdentifier: "PurchaseTableViewCell")
        self.getProducts()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as! PurchaseTableViewCell
        let product = products[indexPath.row]
        cell.labelPProduct.text = product.name!
        downloadImage(urlstr: product.image ?? "", imageView: cell.imgPProduct!)
        return cell
    }
    
    func getProducts(){
        Order.sharedInstance.array[EmailPass.sharedInstance.passEmail!] = Order.sharedInstance.arr
        for (key, value) in Order.sharedInstance.array {
            print("key: \(key)")
                self.products = value
        }
        self.tableViewO.reloadData()
            
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
