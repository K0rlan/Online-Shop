//
//  InfoViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit

class InfoViewController: UIViewController {
    var selected = [Data]()
    
    var selectedfor = [ProductInCategory]()
    var firstEmail: String!
    var secondEmail: String!
    @IBOutlet weak var proImage: UIImageView!
    @IBOutlet weak var proAlias: UILabel!
    @IBOutlet weak var proPrice: UILabel!
    @IBOutlet weak var proLabel: UILabel!
    
    @IBAction func addtoFavourites(_ sender: Any) {
//        if Favourites.sharedInstance.array.contains(selected[0]) {
//            Favourites.sharedInstance.array.remove(at: selected[0].id!)
//            }else{
//                Favourites.sharedInstance.array.append(selected[0])
//            }
        Favourites.sharedInstance.arr.append(selected[0])
        
        
//        print(EmailPass.sharedInstance.passEmail!)
    }
    @IBAction func addToBasket(_ sender: Any) {
        Basket.sharedInstance.arr.append(selected[0])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedfor.isEmpty{
        downloadImage(urlstr: selected[0].image ?? "", imageView: proImage)
        self.proLabel.text = selected[0].name
        self.proAlias.text = selected[0].alias
            self.proPrice.text = String(selected[0].price!)
        } else if selected.isEmpty{
            downloadImage(urlstr: selectedfor[0].image ?? "", imageView: proImage)
            self.proLabel.text = selectedfor[0].name
        }
       
    }
    
    func downloadImage(urlstr: String, imageView: UIImageView) {
        let url = URL(string: urlstr)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    

}
//class Favourites {
//    static let sharedInstance = Favourites()
//    var array = [Data]()
//}
class Favourites {
    static let sharedInstance = Favourites()
    var array = [String: [Data]]()
    var arr = [Data]()
}
class Basket {
    static let sharedInstance = Basket()
    var array = [String: [Data]]()
    var arr = [Data]()
}
