//
//  CurrencyCodeData.swift
//  CurrencyCode
//
//  Created by Elena Kulakova on 2019-12-27.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import Foundation

struct CurrencyCode {
    var base: String
    var rates: [Rate]
    
    struct Rate {
        var name: String
        var value: Double
    }
    
    init(json: [String:Any]) {
        self.base = json["base"] as? String ?? ""
        if let ratesDictionary = json["rates"] as? [String:Any] {
//            self.rates = ratesDictionary.compactMap{ (key,value) -> Rate? in
//                if let doubleValue = value as? Double {
//                    return Rate(name: key, value: doubleValue)
//                } else { return nil }
//            }
            
            self.rates = []
            for (key, value) in ratesDictionary {
                if let doubleValue = value as? Double {
                    let rate = Rate(name: key, value: doubleValue)
                    self.rates.append(rate)
                }
            }
        } else {
            self.rates = []
        }
    }
}

