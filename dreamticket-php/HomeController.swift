//
//  HomeController.swift
//  Dreamticket
//
//  Created by Developer on 29/11/2018.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit
import Alamofire

class HomeController: UIViewController {
    
    let URL_USER_REGISTER = "http://127.0.0.1/ioslogin/register.php"
    let URL_USER_LOGOUT = "http://127.0.0.1/ioslogin/logout.php"

    @IBOutlet weak var LabelName: UILabel!
    

    @IBAction func logOut(_ sender: UIButton) {
        //Sending http post request
        Alamofire.request(URL_USER_LOGOUT, method: .post).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.LabelName.text = jsonData.value(forKey: "message") as! String?
                }
        }
    }
}
