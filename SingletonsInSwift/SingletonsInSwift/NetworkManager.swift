//
//  NetworkManager.swift
//  SingletonsInSwift
//
//  Created by Kelson Hartle on 1/28/21.
//

import Foundation


class NetworkManager {
    
    static let networkManagerSingleton = NetworkManager()
    
    let currentPriceUrl = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!
    var currentPrice = 0.0
    let jsonDecoder = JSONDecoder()
    
    private init() {
        
    }
    
    func fetchNetworkData(completion: @escaping () -> Void) {
        
        
        URLSession.shared.dataTask(with: currentPriceUrl) { (data, response, error) in
            if let error = error {
                print(error)
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try self.jsonDecoder.decode(BitcoinData.self, from: data)
                self.currentPrice = decodedData.bpi.USD.rate_float
                completion()
                
            } catch {
                print("Unable to decode the data")
            }
            
        }.resume()
    }
}

