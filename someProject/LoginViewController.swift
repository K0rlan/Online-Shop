//
//  LoginViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {
//koko@gmail.com
//1234567
    
    @IBOutlet weak var passwdLog: UITextField!
    @IBOutlet weak var emailLog: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func signIn(_ sender: Any) {
        let parameters = [
             "email": emailLog.text ?? "",
             "password": passwdLog.text ?? "",

         ] as [String: String]
           
         
         Alamofire.request("http://rossonero.kz/api/login", method: .post, parameters: parameters).responseString{(response) in
             if response.response?.statusCode == 200{
                print(response)
                
                Favourites.sharedInstance.arr.removeAll()
                Basket.sharedInstance.arr.removeAll()
                Order.sharedInstance.arr.removeAll()
                
                EmailPass.sharedInstance.passEmail = self.emailLog.text
                self.performSegue(withIdentifier: "segue", sender: response)
                self.emailLog.text = ""
                self.passwdLog.text = ""
             }else{
                 self.alert(title: "Ошибка", message: "Не правильный логин или пароль")
             }
     }
       
        
    }
  

func alert(title: String, message: String){
    let alerts = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    alerts.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in
        alerts.dismiss(animated: true, completion: nil)
    }))
    self.present(alerts, animated: true, completion: nil)
}
}
class EmailPass {
    static let sharedInstance = EmailPass()
    var passEmail: String!
}

