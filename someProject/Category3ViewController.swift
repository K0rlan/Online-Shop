//
//  Category3ViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit

class Category3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var selected = [Category]()
    var selected2 = [Category](){
        didSet{
            DispatchQueue.main.async {
                self.tabelView3.reloadData()
            }
        }
    }
    
    
    @IBOutlet weak var tabelView3: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selected2 = selected[0].categories ?? []
//        selected2.forEach{(category) in
//        print(category.name)
        self.tabelView3.delegate = self
        self.tabelView3.dataSource = self
        self.tabelView3.register(UINib(nibName: "Category3TableViewCell", bundle: nil), forCellReuseIdentifier: "Category3TableViewCell")
        }
       
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selected2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category3TableViewCell", for: indexPath) as! Category3TableViewCell
        let category = selected2[indexPath.row]
        cell.c3label.text = category.name
        downloadImage(urlstr: category.image ?? "", imageView: cell.c3image)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.selected2[indexPath.item]
        if let vc = storyboard?.instantiateViewController(identifier: "ProductInCategoryViewController") as? ProductInCategoryViewController{
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



