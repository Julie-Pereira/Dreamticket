//
//  ViewController.swift
//  dreamticket-php
//
//  Created by Developer on 05/12/2018.
//  Copyright © 2018 Developer. All rights reserved.
//
import Alamofire
import UIKit

class SigninController: UIViewController {
    
    //Defined a constant that holds the URL for our web service
    //let URL_USER_REGISTER = "http://192.168.239.128/ioslogin/register.php"
    let URL_USER_REGISTER = "http://127.0.0.1/ioslogin/register.php"
    
    @IBOutlet weak var textFieldUsername: UITextField!
    

    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldAddress: UITextField!

    @IBOutlet weak var textFieldPhone: UITextField!
    
    //@IBOutlet weak var labelMessage: UILabel!
    
 
    @IBAction func seConnecter(_ sender: UIButton) {
        //creating parameters for the post request
        let parameters: Parameters=[
            "username":textFieldUsername.text!,
            "password":textFieldPassword.text!,
            "name":textFieldName.text!,
            "email":textFieldEmail.text!,
            "phone":textFieldPhone.text!,
            "address":textFieldAddress.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    //self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


