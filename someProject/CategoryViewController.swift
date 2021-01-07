//
//  CategoryViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var categorydatas  = [DataCategory](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
//    var category  = [Category]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        self.getProducts()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorydatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        let categorydata = categorydatas[indexPath.row]
        cell.catLabel.text = categorydata.name
        downloadImage(urlstr: categorydata.image ?? "", imageView: cell.catImage)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.categorydatas[indexPath.item]
        if let vc = storyboard?.instantiateViewController(identifier: "CategoryInCategoryViewController") as? CategoryInCategoryViewController{
            vc.selected = [object]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func getProducts(){
        Alamofire.request("http://rossonero.kz/api/categories/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{(response: DataResponse<CategoryResponse>) in
//            print(response)
            if let result = response.result.value{
                
                self.categorydatas = result.data ?? []
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
        return 130
    }


}
