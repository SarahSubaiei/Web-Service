//
//  ViewController.swift
//  Web Service
//
//  Created by sarah on 2/24/18.
//  Copyright © 2018 sarah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let Manager = AFHTTPSessionManager()
        
        Manager.get("http://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=b6907d289e10d714a6e88b30761fae22",
                    parameters: nil,
                    progress: nil,
                    success: { (operation: URLSessionDataTask, responseObject:Any?) in
                        if let responseObject = responseObject {
                            print("Response: " + (responseObject as AnyObject).description)
                            let json = JSON(responseObject)
                            if let forecast = json["list"][0]["weather"][0]["description"].string {
                                self.forcastLabel.text = forecast
                            }
                        }
        }) { (operation:URLSessionDataTask?, error:Error) in
            print("Error: " + error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBOutlet weak var forcastLabel: UILabel!

    
}
