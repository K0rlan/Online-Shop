//
//  ProductInCategoryViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//koko@gmail.com

import UIKit
import Alamofire
import AlamofireObjectMapper

class ProductInCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    var selected = [Category]()
    var categoryID: Int?
    
    var products  = [ProductInCategory](){
        didSet{
            DispatchQueue.main.async {
                self.tableVIew4.reloadData()
                
            }
        }
    }
   
    @IBOutlet weak var tableVIew4: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryID = selected[0].id!
//        print(categoryID)
        self.tableVIew4.delegate = self
        self.tableVIew4.dataSource = self
        self.tableVIew4.register(UINib(nibName: "ProductInCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductInCategoryTableViewCell")
        self.getProducts()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInCategoryTableViewCell", for: indexPath) as! ProductInCategoryTableViewCell
        let product = products[indexPath.row]
        cell.prcLabel.text = product.name
        downloadImage(urlstr: product.image ?? "", imageView: cell.prcImage)
        return cell
    }

    func getProducts(){
        print(categoryID!)
        Alamofire.request("http://rossonero.kz/api/categories/\(categoryID!)/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{(response: DataResponse<ProductInCategoryResponse>) in
            print(response)
            if let result = response.result.value{
                self.products = (result.data?.products)!
                self.tableVIew4.reloadData()
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
        return 130
    }

}
