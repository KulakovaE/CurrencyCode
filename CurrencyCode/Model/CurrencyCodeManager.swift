//
//  CurrencyCodeManager.swift
//  CurrencyCode
//
//  Created by Elena Kulakova on 2019-12-27.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import Foundation

protocol CurrencyCodeDelegate {
    func didGetResult(_ currencyCodeData: CurrencyCode)
    func didFailWithError(error: Error)
}

struct CurrencyCodeManager {
    let currencyCodeURL = "https://api.exchangerate-api.com/v4/latest/SEK"
    
    var delegate: CurrencyCodeDelegate?
    
    //Create the Networking, fetch the currencyCodeData
    func performRequest(with urlString: String) {
        //Step 1: Create a URL
        if let url = URL(string: urlString) {
            //Step 2: Create URLSession
            let session = URLSession(configuration: .default)
            //Step 3: Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
                    if let currencyCodeData = self.parseJSON(safeData) {
                        self.delegate?.didGetResult(currencyCodeData)
                    }
                }
            }
            //Step 4: Start the task
            task.resume()
        }
    }
    
    //Pasing data from a JSON format
    func parseJSON(_ data: Data) -> CurrencyCode? {
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let currencyCode = CurrencyCode(json: json)
                return currencyCode
            } else { return nil }
        } catch _ as NSError {
           return nil
        }
    }
}


