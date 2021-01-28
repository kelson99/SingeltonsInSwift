//
//  ViewController.swift
//  SingletonsInSwift
//
//  Created by Kelson Hartle on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.networkManagerSingleton.fetchNetworkData {
            self.updateViews()
        }
    }
    
    func updateViews() {
        let price = NetworkManager.networkManagerSingleton.currentPrice
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        let priceString = currencyFormatter.string(from: NSNumber(value: price))
        
        DispatchQueue.main.async {
            self.title = priceString
        }
    }


}

