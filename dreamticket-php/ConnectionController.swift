//
//  ConnectionController.swift
//  dreamticket-php
//
//  Created by Developer on 07/12/2018.
//  Copyright © 2018 Developer. All rights reserved.
//
import Alamofire
import UIKit

class ConnectionController: UIViewController {
    //Defined a constant that holds the URL for our web service
    //let URL_USER_LOGIN = "http://192.168.239.128/ioslogin/login.php"
    let URL_USER_LOGIN = "http://127.0.0.1/ioslogin/login.php"
    
    //@IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var textUsername: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
  

    @IBAction func buttonConnected(_ sender: UIButton) {
        //creating parameters for the post request
        let parameters: Parameters=[
            "username":textUsername.text!,
            "password":textPassword.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    //self.labelName.text = jsonData.value(forKey: "message") as! String?
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
