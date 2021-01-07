//
//  BasketViewController.swift
//  someProject
//
//  Created by Koko on 10/28/20.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var products = [Data](){
        didSet{
            DispatchQueue.main.async {
                self.tableViewB.reloadData()
            }
        }
    }
    @IBAction func orderBtn(_ sender: Any) {
        products.forEach{(p) in
            Order.sharedInstance.arr.append(p)
        }
        
    }
    
    @IBOutlet weak var tableViewB: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewB.delegate = self
        self.tableViewB.dataSource = self
        self.tableViewB.register(UINib(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "BasketTableViewCell")
        self.getProducts()
    }
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        let product = products[indexPath.row]
        cell.labelBProduct.text = product.name!
        downloadImage(urlstr: product.image ?? "", imageView: cell.imgBProduct!)
        return cell
    }
    func getProducts(){
        Basket.sharedInstance.array[EmailPass.sharedInstance.passEmail!] = Basket.sharedInstance.arr
        for (key, value) in Basket.sharedInstance.array {
            print("key: \(key)")
                self.products = value
        }
        self.tableViewB.reloadData()
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
class Order {
    static let sharedInstance = Order()
    var array = [String: [Data]]()
    var arr = [Data]()
}

