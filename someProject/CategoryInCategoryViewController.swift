//
//  CategoryInCategoryViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit

class CategoryInCategoryViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    @IBOutlet weak var tableView2: UITableView!
    var selected = [DataCategory]()
    var categories = [Category](){
        didSet{
            DispatchQueue.main.async {
                self.tableView2.reloadData()
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = selected[0].categories ?? []
//        categorues.forEach{(category) in
//        print(category.name)
        self.tableView2.delegate = self
        self.tableView2.dataSource = self
        self.tableView2.register(UINib(nibName: "Category2TableViewCell", bundle: nil), forCellReuseIdentifier: "Category2TableViewCell")
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category2TableViewCell", for: indexPath) as! Category2TableViewCell
        let category = categories[indexPath.row]
        cell.c2label.text = category.name
        downloadImage(urlstr: category.image ?? "", imageView: cell.c2image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.categories[indexPath.item]
        if let vc = storyboard?.instantiateViewController(identifier: "Category3ViewController") as? Category3ViewController{
            vc.selected = [object]
            self.navigationController?.pushViewController(vc, animated: true)
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
