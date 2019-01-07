//
//  HomeController.swift
//  dreamticket-php
//
//  Created by Developer on 06/12/2018.
//  Copyright © 2018 Developer. All rights reserved.
//
import Alamofire
import UIKit

class CreateTicketController: UIViewController {
    //Defined a constant that holds the URL for our web service
    //let URL_USER_REGISTER = "http://192.168.239.128/ioslogin/addTicket.php"
    //let URL_USER_LOGOUT = "http://192.168.239.128/ioslogin/logout.php"
    let URL_USER_REGISTER = "http://127.0.0.1/ioslogin/addTicket.php"
    let URL_USER_LOGOUT = "http://127.0.0.1/ioslogin/logout.php"
    

    @IBOutlet weak var textFieldType: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var SegmentedTicket: UISegmentedControl!
    //@IBOutlet weak var textFieldType: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    //@IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var deviceImages: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
        @IBAction func addTicket(_ sender: UIButton) {
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "name":textFieldName.text!,
            "type":textFieldType.text!,
            "price":textFieldPrice.text!
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
                    self.labelName.text = jsonData.value(forKey: "message") as! String?
                }
        }
    
    }
    
    @IBAction func ActionTicket(_ sender: Any) {
        
        switch (self.SegmentedTicket.selectedSegmentIndex){
        case 0 :
            self.deviceImages.image = #imageLiteral(resourceName: "metro");
            self.Button1.isHidden = true;
            self.Button2.isHidden = true;
            self.Button3.isHidden = true;
            self.Label1.isHidden = true;
            self.Label2.isHidden = true;
            self.Label3.isHidden = true;
            break;
        case 1 :
            self.deviceImages.image = #imageLiteral(resourceName: "cinema");
            self.Button1.isHidden = true;
            self.Button2.isHidden = true;
            self.Button3.isHidden = true;
            self.Label1.isHidden = true;
            self.Label2.isHidden = true;
            self.Label3.isHidden = true;
            
            break;
        case 2 :
            self.deviceImages.image = #imageLiteral(resourceName: "theatre");
            self.Button1.isHidden = true;
            self.Button2.isHidden = true;
            self.Button3.isHidden = true;
            self.Label1.isHidden = true;
            self.Label2.isHidden = true;
            self.Label3.isHidden = true;
            break;
        case 3 :
            self.deviceImages.image = #imageLiteral(resourceName: "sport1");
            self.Button1.isHidden = false;
            self.Button2.isHidden = false;
            self.Button3.isHidden = false;
            self.Label1.isHidden = false;
            self.Label2.isHidden = false;
            self.Label3.isHidden = false;
            self.Label1.text = "Football";
            self.Label2.text = "Rugby";
            self.Label3.text = "Basketball";
            break;
        default:
            break;
        }
    }
    

    @IBAction func checkboxTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false;
        } else {
            sender.isSelected = true;
            Button2.isSelected = false;
            Button3.isSelected = false;
        }
    }
    
    @IBAction func chekbox2(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false;
        } else {
            sender.isSelected = true;
            Button1.isSelected = false;
            Button3.isSelected = false;
        }
    }
    
    @IBAction func chekbox3(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false;
        } else {
            sender.isSelected = true;
            Button1.isSelected = false;
            Button2.isSelected = false;
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

