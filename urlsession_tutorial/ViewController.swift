//
//  ViewController.swift
//  urlsession_tutorial
//
//  Created by Zephaniah Cohen on 1/10/17.
//  Copyright © 2017 CodePro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiService = WeatherAPIService()
    
    @IBOutlet weak var textView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginWebRequest(_ sender: Any) {
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=af60445a0239ffd60ae1f6567e260e63")
        
        apiService.executeWebRequest(urlToExecute: url!) { (responseDict, error) in
            DispatchQueue.main.async {
                
                if let unwrappedError = error {
                    print(unwrappedError.localizedDescription)
                }
                
                self.textView.text = responseDict?.description
            }
        }
    }

}

