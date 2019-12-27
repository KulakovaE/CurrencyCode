//
//  ViewController.swift
//  CurrencyCode
//
//  Created by Elena Kulakova on 2019-12-27.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonValuePressed(_ sender: Any) {
        if let ratesTableVC = storyboard?.instantiateViewController(identifier: "RatesTableViewController") {
            self.navigationController?.pushViewController(ratesTableVC, animated: true)
        }
    }
}

