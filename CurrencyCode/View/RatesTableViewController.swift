//
//  RatesTableViewController.swift
//  CurrencyCode
//
//  Created by Elena Kulakova on 2019-12-27.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class RatesTableViewController: UITableViewController {

    var currencyCodeManager = CurrencyCodeManager()
    var rates: [CurrencyCode.Rate] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyCodeManager.delegate = self
        currencyCodeManager.performRequest(with: currencyCodeManager.currencyCodeURL)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateTableViewCell", for: indexPath)
        if let cell = cell as? RateTableViewCell {
            cell.rateLabel.text = "\(self.rates[indexPath.row].name):\(self.rates[indexPath.row].value)"
        }
        return cell
    }

    

}

extension RatesTableViewController: CurrencyCodeDelegate {
    func didGetResult(_ currencyCodeData: CurrencyCode) {
        DispatchQueue.main.async {
            self.rates = currencyCodeData.rates
            self.tableView.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
        print("Error")
    }
    
    
}
