//
//  ProfileViewController.swift
//  someProject
//
//  Created by Koko on 10/28/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Favourites.sharedInstance.array.forEach{(f) in
//            print(f)
        Favourites.sharedInstance.array[EmailPass.sharedInstance.passEmail!] = Favourites.sharedInstance.arr
//        print(Favourites.sharedInstance.array)
        for (key, value) in Favourites.sharedInstance.array {
            print("key: \(key)")
            value.forEach{(p) in
                print(p.name!)
            }
            
        }
        }
        
    }
    

    


