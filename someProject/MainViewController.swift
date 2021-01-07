//
//  MainViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout  {
   
    
    var products = [Data]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.getProducts()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let product = products[indexPath.row]
        cell.productLabel.text = product.name
        downloadImage(urlstr: product.image ?? "", imageView: cell.productImage)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.products[indexPath.item]
        if let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as? InfoViewController{
            vc.selected = [object]
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    
    func getProducts(){
        Alamofire.request("http://rossonero.kz/api/products", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{(response: DataResponse<ProductClass>) in
//            print(response)
            if let result = response.result.value{
                
                self.products = result.products ?? []
                self.tableView.reloadData()
            }
        }
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
        return 128
    }
}
