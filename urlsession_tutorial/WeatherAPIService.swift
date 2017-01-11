//
//  WeatherAPIService.swift
//  urlsession_tutorial
//
//  Created by Zephaniah Cohen on 1/10/17.
//  Copyright © 2017 CodePro. All rights reserved.
//

import Foundation


class WeatherAPIService {
    
    func executeWebRequest(urlToExecute : URL, completionHandler : @escaping ([String:Any]?, Error?)->Void) {
        
        
        let sharedSession = URLSession.shared
        
        let webRequest = URLRequest(url: urlToExecute)
        
        let dataTask = sharedSession.dataTask(with: webRequest) { (webData, urlResponse, apiError) in
            
            guard let unwrappedData = webData else {
                completionHandler(nil, apiError)
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [String:Any]
                
                completionHandler(jsonResponse, nil)
                
            } catch {
                print(error.localizedDescription)
                completionHandler(nil, error)
            }
        
        }
        
        
        dataTask.resume()
    }
}
