//
//  RegisterViewController.swift
//  someProject
//
//  Created by Koko on 10/27/20.
//

import UIKit
import Alamofire
class RegisterViewController: UIViewController {

    @IBOutlet weak var emailReg: UITextField!
    @IBOutlet weak var passwdReg: UITextField!
    @IBOutlet weak var nameReg: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func register(_ sender: Any) {
        let parameters = [
//             "name": nameReg.text ?? "" ,
             "email": emailReg.text ?? "",
             "password": passwdReg.text ?? "",

         ] as [String: String]
        
//        if (nameReg.text == "" || emailReg.text == "" || passwdReg .text == ""){
//            self.alert(title: "Ошибка", message: "Нужно заполнить все поля")
//        }
//        if passwdReg.text!.count < 6{
//            self.alert(title: "Ошибка", message: "Пароль должен состоять не менее чем из 6 символов")
//        }
//        if (emailReg.text!.count > 191 || nameReg.text!.count > 191) {
//            self.alert(title: "Ошибка", message: "Слишком длинные данные")
//        }
         Alamofire.request("https://reqres.in/api/register", method: .post, parameters: parameters).responseString{(response) in
             if response.result.isSuccess{
                 self.alert(title: "Успех", message: "Вы успешно зарегистрировались")
                print(response)
             }else{
                 self.alert(title: "Oшибка", message: "Что-то пошло не так")
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
